import app/web.{type Context}
import gleam/http.{Get}
import gleam/string_builder
import pages/contact
import pages/home
import wisp.{type Request, type Response}

pub fn handle_request(req: Request, ctx: Context) -> Response {
  use request <- web.middleware(req, ctx)

  case wisp.path_segments(request) {
    [] -> serve_html(request, home.page())
    ["contact"] -> serve_html(request, contact.page())
    _ -> wisp.not_found()
  }
}

fn serve_html(req: Request, content: String) {
  use <- wisp.require_method(req, Get)

  wisp.ok()
  |> wisp.html_body(string_builder.from_string(content))
}
