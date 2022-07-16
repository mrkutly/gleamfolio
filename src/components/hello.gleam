import nakai/html
import nakai/html/attrs

pub fn component() {
  html.section(
    [attrs.id("intro")],
    [
      html.p(
        [],
        [html.Text("I'm Mark Sauer-Utley. I'm a software developer in NYC.")],
      ),
      html.p(
        [],
        [
          html.Text(
            "I spend most of my days building an OS for distributed work at ",
          ),
          highlighted("Almanac.io"),
          html.Text(". I really like "),
          highlighted("functional programming"),
          html.Text(", "),
          highlighted("static type systems"),
          html.Text(", "),
          highlighted("dogs"),
          html.Text(", and"),
          highlighted("cooking"),
          html.Text("."),
        ],
      ),
      html.p([], [html.Text("Want to work together or chat about a project?")]),
    ],
  )
}

fn highlighted(content: String) {
  html.span([attrs.class("color")], [html.Text(content)])
}
