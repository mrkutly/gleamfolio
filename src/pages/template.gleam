import nakai
import nakai/html.{Node, Text}
import nakai/html/attrs

pub fn page(contents: List(Node(a))) {
  html.Fragment([head(), html.body([], contents)])
  |> nakai.render
}

fn head() {
  html.head([
    html.title([], [Text("✨ mark sauer-utley ✨")]),
    html.link([attrs.rel("stylesheet"), attrs.href("/static/index.css")]),
    html.link([attrs.rel("icon"), attrs.href("/static/favicon.png")]),
    html.link([
      attrs.rel("prefetch"),
      attrs.href("https://mantrapercussion.org"),
    ]),
    html.link([attrs.rel("prefetch"), attrs.href("/contact")]),
    html.link([
      attrs.rel("prefetch"),
      attrs.href("https://blog.marksauerutley.com"),
    ]),
  ])
}
