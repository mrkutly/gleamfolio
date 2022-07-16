import components/interests
import components/projects
import components/headers
import pages/template

pub fn page() {
  template.page([headers.home(), interests.component(), projects.component()])
}
