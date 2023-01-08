import gleam/erlang
import gleam/erlang/file
import gleam/http/cowboy
import gleam/http/response.{Response}
import gleam/http/request.{Request}
import gleam/bit_builder.{BitBuilder}
import gleam/uri
import gleam/string
import gleam/list
import pages/home
import pages/contact

pub type Route {
  HtmlRoute(content: String)
  StaticRoute(content: BitString, content_type: String)
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

fn router(request: Request(t)) -> Route {
  let path_segments = uri.path_segments(request.path)

  case path_segments {
    ["contact"] -> HtmlRoute(contact.page())
    [] -> HtmlRoute(home.page())
    ["static", ..rest] -> {
      assert Ok(content) = file.read_bits(string.join(["static", ..rest], "/"))
      get_static_route(content, path_segments)
    }
    ["favicon.ico"] -> {
      assert Ok(content) = file.read_bits("static/favicon.ico")
      StaticRoute(content, "image/x-icon")
    }
    _ -> NotFound
  }
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

    StaticRoute(_, content_type) ->
      res
      |> response.prepend_header("made-with", "Gleam")
      |> response.prepend_header("content-type", content_type)

    _ ->
      res
      |> response.prepend_header("made-with", "Gleam")
  }
}

fn set_body(route: Route, res: Response(String)) {
  let body = case route {
    HtmlRoute(content) -> bit_builder.from_string(content)
    StaticRoute(content, _) -> bit_builder.from_bit_string(content)
    NotFound -> bit_builder.from_string("Not found.")
  }
  response.set_body(res, body)
}

pub fn get_static_route(
  content: BitString,
  path_segments: List(String),
) -> Route {
  assert Ok(resource) = list.last(path_segments)
  let chunks = string.split(resource, on: ".")
  assert Ok(file_extension) = list.last(chunks)

  case file_extension {
    "js" -> StaticRoute(content, "text/javascript; charset=utf-8")
    "svg" -> StaticRoute(content, "image/svg+xml")
    "png" -> StaticRoute(content, "image/png")
    "css" -> StaticRoute(content, "text/css")
    "woff" -> StaticRoute(content, "font/woff")
    "woff2" -> StaticRoute(content, "font/woff2")
    _ -> StaticRoute(content, "text/plain")
  }
}
