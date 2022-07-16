import nakai/html.{Text, div, h2, h3, li, section, ul}
import nakai/html/attrs
import gleam/list

pub type Interests {
  Interests(languages: List(String), frameworks: List(String))
}

const interests = Interests(
  languages: ["typescript", "elixir", "gleam", "ruby"],
  frameworks: ["phoenix", "nest.js", "ruby on rails", "react", "next.js"],
)

pub fn component() {
  section(
    [attrs.id("skills")],
    [
      div([attrs.class("skills-animation")], []),
      div(
        [attrs.class("skills-grid")],
        [
          h2([attrs.class("reveal")], [Text("Skills &amp; Interests")]),
          div(
            [attrs.class("reveal")],
            [
              div(
                [attrs.class("skills-subgrid")],
                [
                  h3([], [Text("LANGUAGES")]),
                  unordered_list(interests.languages),
                  h3([], [Text("FRAMEWORKS")]),
                  unordered_list(interests.frameworks),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  )
}

fn unordered_list(items: List(String)) {
  items
  |> list.map(fn(x: String) { li([], [Text(x)]) })
  |> ul([], _)
}
