import gleam/erlang
import pages/home
import gleam/http/cowboy
import gleam/http/response.{Response}
import gleam/http/request.{Request}
import gleam/bit_builder.{BitBuilder}

// Start it on port 8080!
//
pub fn main() {
  assert Ok(_) = cowboy.start(gleamfolio_server, on_port: 8080)
  erlang.sleep_forever()
}

fn gleamfolio_server(request: Request(t)) -> Response(BitBuilder) {
  let body =
    router(request)
    |> bit_builder.from_string

  response.new(200)
  |> response.prepend_header("made-with", "Gleam")
  |> response.set_body(body)
}

fn router(request: Request(t)) -> String {
  case request.path {
    "/contact" -> "contact page will come!"
    _ -> home.page()
  }
}
