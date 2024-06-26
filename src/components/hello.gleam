import nakai/attr
import nakai/html

pub fn component() {
  html.section([attr.id("intro")], [
    html.p([], [
      html.Text("I'm Mark Sauer-Utley. I'm a software developer in NYC."),
    ]),
    html.p([], [
      html.Text(
        "I spend most of my days building tools to automate security reviews at ",
      ),
      highlighted("SafeBase.io"),
      html.Text(". I really like "),
      highlighted("functional programming"),
      html.Text(", "),
      highlighted("static type systems"),
      html.Text(", "),
      highlighted("dogs"),
      html.Text(", and "),
      highlighted("cooking"),
      html.Text("."),
    ]),
    html.p([], [html.Text("Want to work together or chat about a project?")]),
  ])
}

fn highlighted(content: String) {
  html.span([attr.class("color")], [html.Text(content)])
}
