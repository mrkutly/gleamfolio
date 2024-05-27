import app/router
import app/web.{Context}
import gleam/erlang/process
import mist
import wisp

pub type Route {
  HtmlRoute(content: String)
  StaticRoute(content: String, content_type: String)
  NotFound
}

pub fn main() {
  wisp.configure_logger()
  let ctx = Context(static_directory: static_directory())
  let secret_key_base = wisp.random_string(64)

  let handler = router.handle_request(_, ctx)

  let assert Ok(_) =
    wisp.mist_handler(handler, secret_key_base)
    |> mist.new
    |> mist.port(8080)
    |> mist.start_http

  process.sleep_forever()
}

pub fn static_directory() -> String {
  let assert Ok(priv) = wisp.priv_directory("gleamfolio")
  priv <> "/static"
}
