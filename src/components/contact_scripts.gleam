import nakai/html
import nakai/html/attrs

pub fn head() {
  html.Fragment([
    html.Element("script", [attrs.src("/static/js/face.js")], []),
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
  ])
}

pub fn body() {
  html.Fragment([
    html.Element(
      "script",
      [
        attrs.src(
          "https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.4/clipboard.min.js",
        ),
      ],
      [],
    ),
    html.Element("script", [attrs.src("/static/js/contact.js")], []),
    html.Element("script", [attrs.src("/static/js/logMessage.js")], []),
  ])
}
