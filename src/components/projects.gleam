import gleam/list
import gleam/option.{type Option, None, Some}
import nakai/attr
import nakai/html.{type Node}

pub type Project {
  Project(title: String, details: String, link: Option(String), date: String)
}

const projects = [
  Project(
    link: None,
    date: "2023-2024",
    title: "SafeBase AI Questionnaire Assistance",
    details: "Built a platform to ingest security questionnaires, fill them out using AI, check human approval where necessary, and export them into their desired format.",
  ),
  Project(
    link: None,
    date: "01.2022",
    title: "Almanac Slack Integration",
    details: "Built a Slack application that allows users to take actions in the Almanac platform from slack notifications.",
  ),
  Project(
    link: None,
    date: "03.2021",
    title: "Respondent Atlas Search",
    details: "Integrated Atlas Search into the Respondent platform, allowing our admins to quickly search our collection of 1.2 million profiles based on 15 different matching criteria. Allows us to leverage the power of the Lucene engine without the hassle of managing an Elastic Search service.",
  ),
  Project(
    link: None,
    date: "01.2021",
    title: "Respondent Zoom Integration",
    details: "Integrated the Zoom API into the Respondent platform, allowing research participants to schedule video calls with researchers without gaining access to their private meeting links. Launched with 0 bugs reported.",
  ),
  Project(
    link: Some("https://mantrapercussion.org"),
    date: "02.2019",
    title: "Mantra Percussion",
    details: " Website for the NYC-based percussion band Mantra Percussion. Built with Gatsby, Typescript and styled-components. Hosted on Netlify. WIP.",
  ),
]

pub fn component() {
  projects
  |> list.map(project_component)
  |> projects_grid()
  |> node_to_node_list()
  |> list.prepend(work_animation())
  |> work_section()
}

fn project_component(project: Project) {
  project
  |> maybe_wrap_in_link(project_info(project))
  |> list.prepend([project_details(project)], _)
  |> html.div([attr.class("project-container")], _)
}

fn maybe_wrap_in_link(project: Project, node: Node) -> Node {
  case project.link {
    Some(link) -> html.a([attr.href(link)], [node])
    None -> node
  }
}

fn project_info(project: Project) {
  html.div([attr.class("project reveal")], [
    html.Element("span", [attr.class("date")], [html.Text(project.date)]),
    html.Element("span", [attr.class("title")], [html.Text(project.title)]),
  ])
}

fn project_details(project: Project) {
  html.div([attr.class("project-details reveal")], [
    html.p([], [html.Text(project.details)]),
  ])
}

fn projects_grid(children: List(Node)) -> Node {
  html.div([attr.class("work-grid")], children)
}

fn work_animation() {
  html.div([attr.id("work-animation")], [])
}

fn node_to_node_list(a: Node) -> List(Node) {
  [a]
}

fn work_section(children: List(Node)) -> Node {
  html.section([attr.id("work")], children)
}
