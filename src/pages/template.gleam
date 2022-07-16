import nakai
import nakai/html.{Element, Node, Text}
import nakai/html/attrs

pub fn page(contents: List(Node(a))) {
  html.Fragment([head(), ..contents])
  |> nakai.render
}

fn head() {
  html.head([
    html.title([], [Text("✨ mark sauer-utley ✨")]),
    html.link([attrs.rel("stylesheet"), attrs.href("/static/index.css")]),
    html.link([attrs.rel("icon"), attrs.href("/static/favicon.ico")]),
    html.link([
      attrs.rel("prefetch"),
      attrs.href("https://mantrapercussion.org"),
    ]),
    html.link([attrs.rel("prefetch"), attrs.href("/contact")]),
    html.link([
      attrs.rel("prefetch"),
      attrs.href("https://blog.marksauerutley.com"),
    ]),
    Element("meta", [attrs.Attr("charset", "UTF-8")], []),
    Element(
      "meta",
      [
        attrs.name("viewport"),
        attrs.content("width=device-width, initial-scale=1.0"),
      ],
      [],
    ),
    Element(
      "meta",
      [attrs.Attr("http-equiv", "X-UA-Compatible"), attrs.content("ie-edge")],
      [],
    ),
    Element(
      "meta",
      [
        attrs.name("description"),
        attrs.content(
          "Portfolio for New York-based software developer Mark Sauer-Utley.",
        ),
      ],
      [],
    ),
  ])
}
