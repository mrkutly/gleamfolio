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

type Either(a, b) {
  Left(a)
  Right(b)
}

pub fn main() {
  assert Ok(_) = cowboy.start(my_silly_portfolio, on_port: 8080)
  erlang.sleep_forever()
}

fn my_silly_portfolio(request: Request(t)) -> Response(BitBuilder) {
  let body = case router(request) {
    Left(content) -> bit_builder.from_string(content)
    Right(content) -> bit_builder.from_bit_string(content)
  }

  response.new(200)
  |> response.prepend_header("made-with", "Gleam")
  |> response.set_body(body)
}

fn router(request: Request(t)) -> Either(String, BitString) {
  case uri.path_segments(request.path) {
    ["contact"] -> Left(contact.page())
    [] -> Left(home.page())
    ["static", ..rest] -> {
      assert Ok(content) = file.read_bits(string.join(["static", ..rest], "/"))
      Right(content)
    }
  }
}
