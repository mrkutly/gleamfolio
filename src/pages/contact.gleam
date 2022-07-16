import nakai/html
import nakai/html/attrs
import pages/template
import components/contact_scripts
import components/headers
import components/footers

pub fn page() {
  template.page([
    html.head([
      contact_scripts.head(),
      html.title([], [html.Text("✨ mark sauer-utley | contact ✨")]),
    ]),
    html.body(
      [],
      [
        headers.contact(),
        html.a(
          [attrs.href("/"), attrs.title("home")],
          [html.div([attrs.id("face")], [])],
        ),
        html.main(
          [attrs.class("contact")],
          [
            html.div(
              [],
              [
                html.p(
                  [
                    attrs.id("email"),
                    attrs.Attr("tabIndex", "0"),
                    attrs.Attr("aria-label", "copy my email to your clipboard"),
                    attrs.Attr("role", "button"),
                    attrs.Attr("data-clipboard-target", "#email"),
                  ],
                  [html.Text("mark.sauer.utley@gmail.com")],
                ),
                html.div(
                  [attrs.class("contact-message")],
                  [
                    html.p(
                      [],
                      [
                        html.Text(
                          "i know we all hate these \"mailto\" links that open the mail app.",
                        ),
                      ],
                    ),
                    html.p(
                      [],
                      [
                        html.Text(
                          "just click my email to copy it to your clipboard.",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        footers.contact(),
      ],
    ),
    contact_scripts.body(),
  ])
}
