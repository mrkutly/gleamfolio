import gleam/erlang
import gleam/erlang/file
import gleam/http/cowboy
import gleam/http/response.{Response}
import gleam/http/request.{Request}
import gleam/bit_builder.{BitBuilder}
import gleam/uri
import gleam/string
import pages/home
import pages/contact

type Route {
  HtmlRoute(content: String)
  StaticRoute(content: BitString)
  JsRoute(content: BitString)
  NotFound
}

pub fn main() {
  assert Ok(_) = cowboy.start(my_silly_portfolio, on_port: 8080)
  erlang.sleep_forever()
}

fn my_silly_portfolio(request: Request(t)) -> Response(BitBuilder) {
  let route = router(request)
  let status = status_code(route)

  response.new(status)
  |> set_headers(route, _)
  |> set_body(route, _)
}

fn status_code(route: Route) {
  case route {
    NotFound -> 404
    _ -> 200
  }
}

fn set_headers(route: Route, res: Response(String)) {
  case route {
    HtmlRoute(_) ->
      res
      |> response.prepend_header("made-with", "Gleam")
      |> response.prepend_header("content-type", "text/html; charset=utf-8")

    JsRoute(_) ->
      res
      |> response.prepend_header("made-with", "Gleam")
      |> response.prepend_header(
        "content-type",
        "text/javascript; charset=utf-8",
      )

    _ ->
      res
      |> response.prepend_header("made-with", "Gleam")
  }
}

fn set_body(route: Route, res: Response(String)) {
  let body = case route {
    HtmlRoute(content) -> bit_builder.from_string(content)
    StaticRoute(content) -> bit_builder.from_bit_string(content)
    JsRoute(content) -> bit_builder.from_bit_string(content)
    NotFound -> bit_builder.from_string("Not found.")
  }
  response.set_body(res, body)
}

fn router(request: Request(t)) -> Route {
  case uri.path_segments(request.path) {
    ["contact"] -> HtmlRoute(contact.page())
    [] -> HtmlRoute(home.page())
    ["static", "js", file] -> {
      assert Ok(content) =
        file.read_bits(string.join(["static", "js", file], "/"))
      JsRoute(content)
    }
    ["static", ..rest] -> {
      assert Ok(content) = file.read_bits(string.join(["static", ..rest], "/"))
      StaticRoute(content)
    }
    ["favicon.ico"] -> {
      assert Ok(content) = file.read_bits("static/favicon.ico")
      StaticRoute(content)
    }
    _ -> NotFound
  }
}
