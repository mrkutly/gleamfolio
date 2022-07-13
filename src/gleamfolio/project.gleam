import gleam/json
import gleam/erlang/file
import gleam/dynamic.{decode4, field, list, optional, string}
import gleam/option.{None, Option, Some}
import gleam/html.{Node}
import gleam/html/attrs
import gleam/list

pub type Project {
  Project(title: String, details: String, link: Option(String), date: String)
}

pub fn render_projects() {
  assert Ok(json_string) = file.read("data/projects.json")
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
  project
  |> maybe_wrap_in_link(project_info(project))
  |> list.prepend([project_details(project)], _)
  |> html.div([attrs.class("project-container")], _)
}

fn maybe_wrap_in_link(project: Project, node: Node) -> Node {
  case project.link {
    Some(link) -> html.a([attrs.href(link)], [node])
    None -> node
  }
}

fn project_info(project: Project) -> Node {
  html.div(
    [attrs.class("project reveal")],
    [
      html.Element("span", [attrs.class("date")], [html.Text(project.date)]),
      html.Element("span", [attrs.class("title")], [html.Text(project.title)]),
    ],
  )
}

fn project_details(project: Project) -> Node {
  html.div(
    [attrs.class("project-details reveal")],
    [html.p([], [html.Text(project.details)])],
  )
}
