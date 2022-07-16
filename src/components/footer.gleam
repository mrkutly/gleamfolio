import nakai/html
import nakai/html/attrs

pub fn component() {
  html.footer(
    [],
    [
      footer_link(to: "https://www.github.com/mrkutly", saying: "Github"),
      footer_link(
        to: "https://www.linkedin.com/in/mark-sauer-utley/",
        saying: "LinkedIn",
      ),
      footer_link(to: "https://blog.marksauerutley.com", saying: "Blog"),
      footer_link(to: "/contact.html", saying: "Contact"),
    ],
  )
}

fn footer_link(to href: String, saying text: String) {
  html.a([attrs.href(href)], [html.span([], [html.Text(text)])])
}
