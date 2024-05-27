import gleam/list
import nakai/attr
import nakai/html.{Text, div, h2, h3, li, section, ul}

pub type Interests {
  Interests(languages: List(String), frameworks: List(String))
}

const interests = Interests(
  languages: ["typescript", "elixir", "gleam", "ruby"],
  frameworks: ["phoenix", "nest.js", "ruby on rails", "react", "next.js"],
)

pub fn component() {
  section([attr.id("skills")], [
    div([attr.id("skills-animation")], []),
    div([attr.class("skills-grid")], [
      h2([attr.class("reveal")], [Text("Skills & Interests")]),
      div([attr.class("reveal")], [
        div([attr.class("skills-subgrid")], [
          h3([], [Text("LANGUAGES")]),
          unordered_list(interests.languages),
          h3([], [Text("FRAMEWORKS")]),
          unordered_list(interests.frameworks),
        ]),
      ]),
    ]),
  ])
}

fn unordered_list(items: List(String)) {
  items
  |> list.map(fn(x: String) { li([], [Text(x)]) })
  |> ul([], _)
}
