import nakai/attr
import nakai/html

pub fn home() {
  html.header([], [
    html.a([attr.href("https://www.github.com/mrkutly"), attr.class("first")], [
      html.span([], [html.Text("Github")]),
    ]),
    html.a([attr.href("/contact"), attr.class("second")], [
      html.span([], [html.Text("Contact")]),
    ]),
  ])
}

pub fn contact() {
  html.header([], [
    html.a([attr.href("/"), attr.class("second")], [
      html.span([], [html.Text("Back")]),
    ]),
  ])
}
