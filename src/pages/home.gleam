import components/footers
import components/headers
import components/hello
import components/home_scripts
import components/interests
import components/projects
import nakai/attr
import nakai/html
import pages/template

pub fn page() {
  template.page([
    home_scripts.head(),
    html.Body([], [
      headers.home(),
      html.div([attr.id("face")], []),
      html.main([], [
        hello.component(),
        interests.component(),
        projects.component(),
      ]),
      footers.home(),
    ]),
    home_scripts.body(),
  ])
}
