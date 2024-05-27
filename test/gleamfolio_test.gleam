import gleamfolio
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn get_static_route_test() {
  gleamfolio.static_directory()
  |> should.equal("")
}
