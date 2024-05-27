import app/router
import app/web.{type Context, Context}
import gleam/io
import gleam/string
import gleamfolio
import gleeunit/should
import wisp/testing

fn with_context(testcase: fn(Context) -> t) -> t {
  let context = Context(static_directory: gleamfolio.static_directory())

  testcase(context)
}

pub fn get_home_page_test() {
  use ctx <- with_context
  let request = testing.get("/", [])
  let response = router.handle_request(request, ctx)

  response.status
  |> should.equal(200)

  response.headers
  |> should.equal([#("content-type", "text/html")])

  response
  |> testing.string_body()
  |> string.contains("I'm Mark Sauer-Utley")
  |> should.be_true()
}

pub fn get_contact_page_test() {
  use ctx <- with_context
  let request = testing.get("/contact", [])
  let response = router.handle_request(request, ctx)

  response.status
  |> should.equal(200)

  response.headers
  |> should.equal([#("content-type", "text/html")])

  response
  |> testing.string_body()
  |> string.contains("mark.sauer.utley@gmail.com")
  |> should.be_true()
}

pub fn get_stylesheet_test() {
  use ctx <- with_context
  let request = testing.get("/static/index.css", [])
  let response = router.handle_request(request, ctx)

  response.status
  |> should.equal(200)

  response.headers
  |> should.equal([#("content-type", "text/css")])
}

pub fn not_found_test() {
  use ctx <- with_context
  let request = testing.get("/static/../../home/etc", [])
  let response = router.handle_request(request, ctx)

  response.status
  |> should.equal(404)
}
