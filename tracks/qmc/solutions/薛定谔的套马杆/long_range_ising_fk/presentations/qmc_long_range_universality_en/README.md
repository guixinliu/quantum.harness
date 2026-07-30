# Long-range Ising universality presentation

English Quantum Harness 2026 scientific presentation built from
`track_a_report_en.md` and the report's original figures.

Build from the `long_range_ising_fk` solution directory:

```bash
typst compile --root . \
  --font-path presentations/qmc_long_range_universality_en/fonts \
  presentations/qmc_long_range_universality_en/qmc_long_range_universality_en.typ \
  presentations/qmc_long_range_universality_en/qmc_long_range_universality_en.pdf
```

The deck uses Typst 0.14.2 and the self-contained Touying theme files under
`zoo/`. It contains 27 PDF pages: one title page, six section dividers, and
twenty content slides.
