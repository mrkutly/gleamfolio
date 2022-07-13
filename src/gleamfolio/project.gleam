import gleam/json
import gleam/dynamic.{decode4, field, list, optional, string}
import gleam/option.{Option}
import gleam/html.{Node}
import gleam/html/attrs
import gleam/list

pub type Project {
  Project(title: String, details: String, link: Option(String), date: String)
}

pub fn render_projects(json_string: String) {
  assert Ok(projects) = projects_from_json(json_string)

  projects
  |> list.map(project_to_html)
}

fn projects_from_json(
  json_string: String,
) -> Result(List(Project), json.DecodeError) {
  let project_decoder =
    decode4(
      Project,
      field("title", of: string),
      field("details", of: string),
      field("link", of: optional(string)),
      field("date", of: string),
    )
  json.decode(from: json_string, using: list(of: project_decoder))
}

fn project_to_html(project: Project) -> Node {
  html.div([attrs.class("project-container")], [html.Text(project.title)])
}
