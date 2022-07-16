import pages/template
import components/interests
import components/projects
import components/headers
import components/hello
import components/footer
import nakai/html

pub fn page() {
  template.page([
    headers.home(),
    html.main(
      [],
      [hello.component(), interests.component(), projects.component()],
    ),
    footer.component(),
  ])
}
