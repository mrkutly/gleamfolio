import pages/template
import components/interests
import components/projects
import components/headers
import components/hello
import components/footers
import components/home_scripts
import nakai/html
import nakai/html/attrs

pub fn page() {
  template.page([
    home_scripts.head(),
    html.body(
      [],
      [
        headers.home(),
        html.div([attrs.id("face")], []),
        html.main(
          [],
          [hello.component(), interests.component(), projects.component()],
        ),
        footers.home(),
      ],
    ),
    home_scripts.body(),
  ])
}
