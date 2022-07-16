import nakai/html
import nakai/html/attrs

pub fn head() {
  html.head([
    html.Element(
      "script",
      [
        attrs.src(
          "https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.6.6/lottie.min.js",
        ),
        attrs.Attr(
          "integrity",
          "sha512-/Hza+pHDcPYBU8TLC+TA/fCeM9Ro21bO7TAFVohTDXJ2spJAvdTg1UcNJ929MhSMTzlHDOx7rPhRVSIbJiRNhw==",
        ),
        attrs.Attr("crossorigin", "anonymous"),
        attrs.Attr("referrerpolicy", "no-referrer"),
      ],
      [],
    ),
    html.Element("script", [attrs.src("/static/js/face.js")], []),
    html.Element("script", [attrs.src("/static/js/skills.js")], []),
    html.Element("script", [attrs.src("/static/js/work.js")], []),
  ])
}

pub fn body() {
  html.Fragment([
    html.Element("script", [attrs.src("/static/js/index.js")], []),
    html.Element("script", [attrs.src("/static/js/logMessage.js")], []),
  ])
}
