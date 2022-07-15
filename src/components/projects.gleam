import gleam/option.{None, Option, Some}
import nakai/html.{Node}
import nakai/html/attrs
import gleam/list

pub type Project {
  Project(title: String, details: String, link: Option(String), date: String)
}

const projects = [
  Project(
    link: None,
    date: "01.2022",
    title: "Almanac Slack Integration",
    details: "Built a Slack application that allows users to take actions in the Almanac platform from slack notifications",
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
    link: Some("https://youtu.be/BAujAysxmeo"),
    date: "07.2020",
    title: "Taboola Client Properties UI",
    details: " An in-browser IDE for updating, staging, and deploying code changes to publishers' websites. Saves ~350 hours/month for the Professional Services engineers by simplifying and automating our deployment processes. Built with React, Redux/Thunk, and CodeMirror for the front end. I also built a backend service with Express that is used to provide in-editor linting hints of CSS and JS. All services are deployed with Docker and Kubernetes.",
  ),
  Project(
    link: Some("https://mantrapercussion.org"),
    date: "02.2019",
    title: "Mantra Percussion",
    details: " Website for the NYC-based percussion band Mantra Percussion. Built with Gatsby, Typescript and styled-components. Hosted on Netlify. WIP.",
  ),
]

pub fn component() -> List(Node(a)) {
  projects
  |> list.map(project_component)
  |> projects_grid()
  |> node_to_node_list()
  |> list.prepend(work_animation())
  |> work_section()
  |> node_to_node_list
}

fn project_component(project: Project) {
  project
  |> maybe_wrap_in_link(project_info(project))
  |> list.prepend([project_details(project)], _)
  |> html.div([attrs.class("project-container")], _)
}

fn maybe_wrap_in_link(project: Project, node: Node(a)) -> Node(a) {
  case project.link {
    Some(link) -> html.a([attrs.href(link)], [node])
    None -> node
  }
}

fn project_info(project: Project) {
  html.div(
    [attrs.class("project reveal")],
    [
      html.Element("span", [attrs.class("date")], [html.Text(project.date)]),
      html.Element("span", [attrs.class("title")], [html.Text(project.title)]),
    ],
  )
}

fn project_details(project: Project) {
  html.div(
    [attrs.class("project-details reveal")],
    [html.p([], [html.Text(project.details)])],
  )
}

fn projects_grid(children: List(Node(a))) -> Node(a) {
  html.div([attrs.class("work-grid")], children)
}

fn work_animation() {
  html.div([attrs.id("work-animation")], [])
}

fn node_to_node_list(a: Node(a)) -> List(Node(a)) {
  [a]
}

fn work_section(children: List(Node(a))) -> Node(a) {
  html.section([attrs.id("work")], children)
}
