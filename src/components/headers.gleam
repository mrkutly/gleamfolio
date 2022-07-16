import nakai/html
import nakai/html/attrs

pub fn home() {
  html.header(
    [],
    [
      html.a(
        [attrs.href("https://www.github.com/mrkutly"), attrs.class("first")],
        [html.span([], [html.Text("Github")])],
      ),
      html.a(
        [attrs.href("/contact"), attrs.class("second")],
        [html.span([], [html.Text("Contact")])],
      ),
    ],
  )
}

pub fn contact() {
  html.header(
    [],
    [
      html.a(
        [attrs.href("/"), attrs.class("second")],
        [html.span([], [html.Text("Back")])],
      ),
    ],
  )
}
