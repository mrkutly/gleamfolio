import gleam/json
import gleam/dynamic.{decode2, field, string}
import gleam/erlang/file
import gleam/html.{Node, Text, div, h2, h3, li, section, ul}
import gleam/html/attrs
import gleam/list

pub type Interests {
  Interests(languages: List(String), frameworks: List(String))
}

pub fn render_interests() {
  assert Ok(json_string) = file.read("data/interests.json")
  assert Ok(interests) = interests_from_json(json_string)
  interests_to_html(interests)
}

fn interests_from_json(json_string) -> Result(Interests, json.DecodeError) {
  let interests_decoder =
    decode2(
      Interests,
      field("languages", of: dynamic.list(of: string)),
      field("frameworks", of: dynamic.list(of: string)),
    )

  json.decode(from: json_string, using: interests_decoder)
}

fn interests_to_html(interests: Interests) -> Node {
  section(
    [attrs.id("skills")],
    [
      div(
        [attrs.class("skills-animation")],
        [
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
      ),
    ],
  )
}

fn unordered_list(items: List(String)) {
  items
  |> list.map(fn(x: String) { li([], [Text(x)]) })
  |> ul([], _)
}
