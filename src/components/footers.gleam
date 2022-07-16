import nakai/html
import nakai/html/attrs
import gleam/list

pub fn home() {
  html.footer(
    [],
    list.append(
      common_links(),
      [footer_link(to: "/contact", saying: "Contact")],
    ),
  )
}

pub fn contact() {
  html.footer(
    [],
    list.append(common_links(), [footer_link(to: "/", saying: "Home")]),
  )
}

fn common_links() {
  [
    footer_link(to: "https://www.github.com/mrkutly", saying: "Github"),
    footer_link(
      to: "https://www.linkedin.com/in/mark-sauer-utley/",
      saying: "LinkedIn",
    ),
    footer_link(to: "https://blog.marksauerutley.com", saying: "Blog"),
  ]
}

fn footer_link(to href: String, saying text: String) {
  html.a([attrs.href(href)], [html.span([], [html.Text(text)])])
}
