import gleam/io
import gleam/list
import gleam/erlang/file
import gleamfolio/project.{render_projects}
import gleamfolio/interests.{render_interests}
import gleam/html
import nakai

pub fn main() {
  assert Ok(Nil) =
    render_interests()
    |> list.prepend(render_projects(), _)
    |> html.html([], _)
    |> nakai.html
    |> nakai.render_doc(doctype: html.doctype("html"))
    |> save_html
}

fn save_html(html: String) {
  let path = "dist/index.html"
  case file.is_file(path) {
    True -> file.write(html, to: path)
    False -> {
      assert Ok(Nil) = file.make_directory("dist")
      file.write(html, to: path)
    }
  }
}
