import gleam/html.{Node}
import nakai

pub fn page(contents: List(Node)) {
  contents
  |> html.html([], _)
  |> nakai.html
  |> nakai.render_doc(doctype: html.doctype("html"))
}
