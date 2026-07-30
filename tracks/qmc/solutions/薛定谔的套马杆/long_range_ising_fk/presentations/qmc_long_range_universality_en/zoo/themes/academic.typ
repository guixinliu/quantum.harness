// Academic theme — metropolis base recoloured with the academic palette.
// Serious navy on white, serif heading accent, thin progress bar.
#import "@preview/touying:0.6.1": *
#import themes.metropolis: *
#import "../palettes/academic.typ": palette, fonts

#let wide-new-section-slide(config: (:), level: 1, numbered: true, body) = touying-slide-wrapper(self => {
  let slide-body = {
    set std.align(horizon)
    show: pad.with(8%)
    set text(size: 1.5em)
    stack(
      dir: ttb,
      spacing: 1em,
      text(self.colors.neutral-darkest, utils.display-current-heading(
        level: level,
        numbered: numbered,
        style: auto,
      )),
      block(
        height: 2pt,
        width: 100%,
        spacing: 0pt,
        components.progress-bar(
          height: 2pt,
          self.colors.primary,
          self.colors.primary-light,
        ),
      ),
    )
    text(self.colors.neutral-dark, body)
  }
  self = utils.merge-dicts(
    self,
    config-page(fill: self.colors.neutral-lightest),
  )
  touying-slide(self: self, config: config, slide-body)
})

#let theme(..args, body) = {
  set text(font: fonts.sans, lang: "en")
  show math.equation: set text(font: fonts.serif)
  show: metropolis-theme.with(
    aspect-ratio: "16-9",
    config-colors(
      primary: palette.primary,
      primary-light: palette.primary_light,
      secondary: palette.secondary,
      neutral-lightest: palette.neutral_lightest,
      neutral-dark: palette.neutral_dark,
      neutral-darkest: palette.neutral_darkest,
    ),
    config-common(new-section-slide-fn: wide-new-section-slide),
    ..args,
  )
  body
}
