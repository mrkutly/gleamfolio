import nakai/attr
import nakai/html

pub fn head() {
  html.Head([
    html.Element(
      "script",
      [
        attr.src(
          "https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.6.6/lottie.min.js",
        ),
        attr.Attr(
          "integrity",
          "sha512-/Hza+pHDcPYBU8TLC+TA/fCeM9Ro21bO7TAFVohTDXJ2spJAvdTg1UcNJ929MhSMTzlHDOx7rPhRVSIbJiRNhw==",
        ),
        attr.Attr("crossorigin", "anonymous"),
        attr.Attr("referrerpolicy", "no-referrer"),
      ],
      [],
    ),
    html.Element("script", [attr.src("/static/js/face.js")], []),
    html.Element("script", [attr.src("/static/js/skills.js")], []),
    html.Element("script", [attr.src("/static/js/work.js")], []),
  ])
}

pub fn body() {
  html.Fragment([
    html.Element("script", [attr.src("/static/js/index.js")], []),
    html.Element("script", [attr.src("/static/js/logMessage.js")], []),
  ])
}
