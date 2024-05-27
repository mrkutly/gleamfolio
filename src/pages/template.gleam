import nakai
import nakai/attr
import nakai/html.{type Node, Element}

pub fn page(contents: List(Node)) {
  html.Fragment([head(), ..contents])
  |> nakai.to_string
}

fn head() {
  html.Head([
    html.title("✨ mark sauer-utley ✨"),
    html.link([attr.rel("stylesheet"), attr.href("/static/index.css")]),
    html.link([attr.rel("icon"), attr.href("/static/favicon.ico")]),
    html.link([attr.rel("prefetch"), attr.href("https://mantrapercussion.org")]),
    html.link([attr.rel("prefetch"), attr.href("/contact")]),
    html.link([
      attr.rel("prefetch"),
      attr.href("https://blog.marksauerutley.com"),
    ]),
    Element("meta", [attr.Attr("charset", "UTF-8")], []),
    Element(
      "meta",
      [
        attr.name("viewport"),
        attr.content("width=device-width, initial-scale=1.0"),
      ],
      [],
    ),
    Element(
      "meta",
      [attr.Attr("http-equiv", "X-UA-Compatible"), attr.content("ie-edge")],
      [],
    ),
    Element(
      "meta",
      [
        attr.name("description"),
        attr.content(
          "Portfolio for New York-based software developer Mark Sauer-Utley.",
        ),
      ],
      [],
    ),
  ])
}
