import gleeunit
import gleeunit/should
import gleam/bit_string
import gleamfolio.{StaticRoute}

pub fn main() {
  gleeunit.main()
}

pub fn get_static_route_test() {
  let content = bit_string.from_string("hello world")
  let path_segments = ["static", "face.svg"]

  gleamfolio.get_static_route(content, path_segments)
  |> should.equal(StaticRoute(content, "image/svg+xml"))
}

pub fn get_static_route_nested_test() {
  let content = bit_string.from_string("const hello = 'world';")
  let path_segments = ["static", "js", "index.js"]

  gleamfolio.get_static_route(content, path_segments)
  |> should.equal(StaticRoute(content, "text/javascript; charset=utf-8"))
}
