import components/interests
import components/projects
import gleam/list
import pages/template

pub fn page() {
  interests.component()
  |> list.prepend(projects.component(), _)
  |> template.page
}
