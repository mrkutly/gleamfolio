import components/contact_scripts
import components/footers
import components/headers
import nakai/attr
import nakai/html
import pages/template

pub fn page() {
  template.page([
    html.Head([
      contact_scripts.head(),
      html.title("✨ mark sauer-utley | contact ✨"),
    ]),
    html.Body([], [
      headers.contact(),
      html.a([attr.href("/"), attr.title("home")], [
        html.div([attr.id("face")], []),
      ]),
      html.main([attr.class("contact")], [
        html.div([], [
          html.p(
            [
              attr.id("email"),
              attr.Attr("tabIndex", "0"),
              attr.Attr("aria-label", "copy my email to your clipboard"),
              attr.Attr("role", "button"),
              attr.Attr("data-clipboard-target", "#email"),
            ],
            [html.Text("mark.sauer.utley@gmail.com")],
          ),
          html.div([attr.class("contact-message")], [
            html.p([], [
              html.Text(
                "i know we all hate these \"mailto\" links that open the mail app.",
              ),
            ]),
            html.p([], [
              html.Text("just click my email to copy it to your clipboard."),
            ]),
          ]),
        ]),
      ]),
      footers.contact(),
    ]),
    contact_scripts.body(),
  ])
}
