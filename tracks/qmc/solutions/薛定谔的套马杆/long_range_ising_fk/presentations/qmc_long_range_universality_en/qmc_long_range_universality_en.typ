// QMC finite-size study of the 2D long-range Ising universality boundary
// Build: typst compile qmc_long_range_universality_zh.typ qmc_long_range_universality.pdf

#import "zoo/lib.typ": *

#let pal = palettes.academic
#show: themes.academic.with(config-info(
  title: [2D Long-Range Ising Universality Boundary],
  subtitle: [],
  author: [Gui-Xin Liu, ShanghaiTech University; Hao-Yu Lu, Hong Kong University],
  date: [2026-07-30],
  institution: [#text(font: "Noto Sans CJK SC")[薛定谔的套马杆] · Quantum Harness 2026 · QMC \#86 Track A],
))

#let (rail_pull, callout, codebox, quote_pull, figbox, portrait, clip_image,
      stat, stat_row, spec_list, theorem, definition, lemma, example, proof_box,
      badge, tag, time_badge, data_table, conclusion_grid, key_links, toc,
      pacing, kicker, progress_dots) = gadgets(pal)
#let (spread, twocol, threecol, hero, band, cards, card, punch,
      centered_figure) = layouts(pal)

#let figdir = "../../reports/figures"
#let nndir = "../../results/nn_v3_20260730/analysis"

#title-slide()

= Scientific question

== Is the boundary at _7/4_ or _2_?

#twocol(
  [
    #kicker[Sak scenario]
    #v(4pt)
    #align(left, [$sigma^* = 2 - eta_"SR" = 7/4$])
    #v(6pt)

    At the critical 2D short-range Ising fixed point, the exact spin scaling
    dimension $x_s = 1/8$ gives
    $chevron.l s(0) s(r) chevron.r tilde.op r^(-2x_s) = r^(-1/4)$, hence
    $eta_"SR" = 1/4$.

    The Sak criterion then gives $sigma^* = 2 - eta_"SR" = 7/4$.
  ],
  [
    #kicker[Geometric scenario]
    #v(4pt)
    #align(left, [$sigma^* = 2$])
    #v(6pt)

    In momentum space, the long-range kernel contributes a nonanalytic
    $k^sigma$ term that dominates $k^2$ for $sigma < 2$, suggesting that the
    local short-range term takes over only at $sigma = 2$.
  ],
)

#v(12pt)
#rail_pull[The task is not to choose the prettiest fit, but to test whether the data exclude either boundary.]

== Why is the crossover _hard to resolve_?

#spec_list(
  (term: [Slow drift], desc: [Near the boundary, a small correction exponent delays the asymptotic regime.], tag: [scale]),
  (term: [Model degeneracy], desc: [Power and near-marginal logarithmic drifts can both look linear over finite sizes.], tag: [form]),
  (term: [Fragile intercept], desc: [Similar fit quality can imply different thermodynamic limits.], tag: [limit]),
)

#v(10pt)
#callout([Decision rule], [A thermodynamic claim requires both correction-model agreement and fit-window stability.])

= Model, observables, and calibration

== The model is a _2D long-range Ising ferromagnet_

#kicker[Hamiltonian]
#v(5pt)
#align(left, text(size: 22pt)[
  $H = - sum_(i<j) J_(i j) s_i s_j, quad
  J_(i j) = frac(c(sigma, L), r_(i j)^(2+sigma)), quad s_i = plus.minus 1$
])

#v(12pt)
#spec_list(
  (term: [Geometry], desc: [$L times L$ square torus with the minimum-image distance $r_(i j)$.], tag: [lattice]),
  (term: [Normalization], desc: [$c(sigma,L)$ is chosen so that $sum_j J_(i j) = 4$, summing over all other sites $j$.], tag: [scale]),
  (term: [Range control], desc: [The minus sign makes the interaction ferromagnetic; increasing $sigma$ suppresses distant bonds and drives the model toward short-range Ising behavior.], tag: [physics]),
)

== FK topology gives a _dimensionless critical condition_

#align(center, text(size: 24pt)[
  $R_p equiv chevron.l R_2 chevron.r - q chevron.l R_0 chevron.r,
  quad q=2$
])

#v(14pt)
#spread(
  [
    #kicker[Topological events]
    #v(5pt)
    $R_0$: no FK cluster wraps around the torus.

    #v(7pt)
    $R_2$: an FK cluster wraps in both periodic directions.

    #v(7pt)
    $R_p=0$ means that the two topological sectors satisfy the
    random-cluster critical balance $chevron.l R_2 chevron.r
    =q chevron.l R_0 chevron.r$.
  ],
  [
    #kicker[FK-cluster topology on the torus]
    #v(8pt)
    #align(center, image(
      figdir + "/fk_wrapping_schematic_en.svg",
      width: 440pt,
      fit: "contain",
    ))
  ],
  ratio: (0.95fr, 1.05fr),
)

== _$Q_m$_ records the magnetization-distribution shape

#align(center, text(size: 24pt)[
  $Q_m equiv frac(chevron.l M^2 chevron.r^2, chevron.l M^4 chevron.r)$
])

#v(16pt)
#cards(
  [
    #kicker[Disordered phase]
    #v(6pt)
    $P(M)$ is approximately a Gaussian centered at zero.
    #v(8pt)
    #align(center, [$chevron.l M^4 chevron.r
      =3 chevron.l M^2 chevron.r^2$])
    #v(7pt)
    #align(center, text(size: 22pt, fill: pal.accent_deep)[$Q_m arrow 1/3$])
  ],
  [
    #kicker[Critical point]
    #v(6pt)
    For fixed geometry and boundary conditions, $P(M)$ has a universal
    non-Gaussian finite-size shape.
    #v(10pt)
    #align(center, text(size: 19pt, fill: pal.accent_deep)[$Q_m^"SR" approx 0.856216$])
  ],
  [
    #kicker[Ordered phase]
    #v(6pt)
    $P(M)$ approaches two narrow peaks at $plus.minus M_0$.
    #v(8pt)
    #align(center, [$chevron.l M^4 chevron.r
      approx chevron.l M^2 chevron.r^2$])
    #v(7pt)
    #align(center, text(size: 22pt, fill: pal.accent_deep)[$Q_m arrow 1$])
  ],
  cols: 3,
  gutter: 12pt,
)

== Reduced susceptibility

#spread(
  [
    #kicker[Definition]
    #v(6pt)
    #align(left, text(size: 24pt)[
      $accent(chi, "\u{0303}") equiv L^2 chevron.l m^2 chevron.r$
    ])
  ],
  [
    #kicker[Motivation]
    Measures the growth of critical magnetic fluctuations and yields $eta$
    through finite-size scaling.
  ],
  ratio: (0.85fr, 1.15fr),
)

#v(16pt)
#cards(
  [
    #kicker[Disordered phase]
    #v(6pt)
    Short-range correlations; the magnetization density self-averages.
    #v(7pt)
    #align(center, [$chevron.l m^2 chevron.r tilde.op L^(-2)$])
    #v(6pt)
    #align(center, text(size: 21pt, fill: pal.accent_deep)[
      $accent(chi, "\u{0303}") tilde.op O(1)$
    ])
  ],
  [
    #kicker[Critical point]
    #v(6pt)
    Scale-free correlations. For 2D short-range Ising, $eta=1/4$.
    #v(12pt)
    #align(center, text(size: 19pt, fill: pal.accent_deep)[
      $accent(chi, "\u{0303}") tilde.op L^(7/4)$
    ])
  ],
  [
    #kicker[Ordered phase]
    #v(6pt)
    A finite spontaneous magnetization survives as $L arrow infinity$.
    #v(7pt)
    #align(center, [$chevron.l m^2 chevron.r arrow m_0^2$])
    #v(6pt)
    #align(center, text(size: 21pt, fill: pal.accent_deep)[
      $accent(chi, "\u{0303}") tilde.op m_0^2 L^2$
    ])
  ],
  cols: 3,
  gutter: 12pt,
)

== The strict NN model recovers _η=1/4_

#spread(
  figbox([Figure 2 · Strict-NN calibration],
    align(center, image(figdir + "/nn_eta_ppt_en.svg", height: 220pt)),
    caption: [$chi(L)/L^2$ follows one power law across all four sizes on logarithmic axes.]),
  [
    #align(center)[
      #text(20pt, fill: pal.text)[$chi(L) / L^2 tilde.op A L^(-eta)$]
      #v(10pt)
      #text(20pt, weight: "bold", fill: pal.accent_deep)[$eta = 0.24883$]
    ]
    #v(10pt)
    95% bootstrap interval:

    $[0.24748, 0.25016]$

    #rail_pull[The exact 2D nearest-neighbor Ising critical point has $eta=1/4$.]
  ],
  ratio: (1.15fr, 0.85fr),
)

== Three observables provide _complementary constraints_

#threecol(
  [
    #kicker[FK topology]
    #v(5pt)
    #align(left, [$R_p=chevron.l R_2 chevron.r-2 chevron.l R_0 chevron.r$])
    #v(7pt)
    Probes system-spanning cluster connectivity and supplies a dimensionless critical condition.
  ],
  [
    #kicker[Magnetization shape]
    #v(5pt)
    #align(left, [$Q_m=frac(chevron.l M^2 chevron.r^2, chevron.l M^4 chevron.r)$])
    #v(7pt)
    Compresses the non-Gaussian shape of $P(M)$ into a universal dimensionless ratio.
  ],
  [
    #kicker[Reduced susceptibility]
    #v(5pt)
    #align(left, [$accent(chi, "\u{0303}") equiv L^2 chevron.l m^2 chevron.r$])
    #v(7pt)
    Measures the growth of critical magnetic fluctuations and yields $eta$ through finite-size scaling.
  ],
)

#v(12pt)
#rail_pull[Geometry, distribution shape, and fluctuation scaling test the same critical interpretation from different directions.]

= Official baseline

== The official _L≤512_ grid reproduces drift, not the boundary

#data_table(
  ("σ", "published βc¹", "βc from Rp crossings", "βc from Qm crossings"),
  ("1.75", "0.329136", "0.329148", "0.329434"),
  ("1.875", "0.336985", "0.337304", "0.337593"),
  ("2.0", "0.344439", "0.344857", "0.345165"),
  ("2.5", "0.369446", "0.370195", "0.370435"),
  highlight: (1, 2),
)

#v(3pt)
#align(right, text(size: 11pt, fill: pal.text.lighten(40%))[
  ¹ T. Xiao, Z. Liu, Z. Fan, and Y. Deng, _On Sak's criterion for statistical models with long-range interaction_, arXiv:2512.04805 (2025).
])

#v(5pt)
#twocol(
  [Every crossing lies inside the registered $beta_c plus.minus 0.002$ window, reproducing the expected critical-point drift.],
  [The $R_p$ and $Q_m$ estimates differ slightly because their finite-size corrections are different; neither crossing is itself a universality-boundary estimate.],
)

#rail_pull[The baseline validates the phenomenon but cannot identify the correction law.]

== Effective exponents on the official grid shift toward the _short-range value_

#spread(
  figbox([Figure 1 · Finite-size fits of $eta$ on the official $L<=512$ grid],
    align(left, move(dx: -14pt, image(figdir + "/eta_scaling_ppt_en.svg", height: 220pt))),
    caption: [Across four sampled $sigma$ values, the fitted exponent shifts toward the short-range benchmark $1/4$.]),
  [
    #kicker[Physical meaning]
    - $sigma=1.75$, $eta_"eff"=0.3729$: largest deviation from the short-range benchmark.
    - $sigma=1.875$, $eta_"eff"=0.3204$: substantial finite-size corrections.
    - $sigma=2.0$, $eta_"eff"=0.2915$: closer to $1/4$, without locating the boundary.
    - $sigma=2.5$, $eta_"eff"=0.2546$: consistent with the short-range control.
  ],
  ratio: (1.18fr, 0.82fr),
)

= Extended L≤2048 evidence

== Extending to _L=2048_ reveals a flow, not its endpoint

#figbox([Figure 3 · Finite-size flow at the central critical points],
  align(center, image(figdir + "/critical_finite_size_extended_ppt_en.svg", height: 190pt, fit: "contain")),
  caption: [Left: $R_p(L)$. Right: $Q_m(L)$. $sigma=1.75$ retains the clearest long-range signature; $1.875$ and $2.0$ drift slowly; $2.5$ flows into the short-range Ising class.])

#v(6pt)
#rail_pull[The direction of flow is resolved; its asymptotic boundary is not.]

== Competing _$R_p$_ extrapolations

#grid(
  columns: (455pt, 1fr),
  column-gutter: 10pt,
  align: top,
  align(left, image(
    figdir + "/competing_extrapolations_rp_ppt_en.svg",
    width: 455pt,
    fit: "contain",
  )),
  [
    #v(12pt)
    #text(size: 13pt)[
      $"AICc" = -2 ln cal(L)_"max" + 2k + frac(2k(k+1), n-k-1)$
    ]
    #v(12pt)
    #text(size: 12pt, fill: pal.text.lighten(30%))[
      $n$: data points \
      $k$: fitted parameters \
      $cal(L)_"max"$: maximum likelihood
    ]
    #v(12pt)
    #text(size: 14pt)[Lower AICc is preferred.]
  ],
)

#v(8pt)
#rail_pull[$sigma=1.75$: power has lower AICc, but $chi^2/"dof"=7.1$ and $R_(p,infinity)=2.27$ make the limit noncredible. $sigma=2$: $abs(Delta "AICc")=0.06$ leaves the endpoint ambiguous.]

== Competing _$Q_m$_ extrapolations

#figbox([Figure 4b · Competing $Q_m$ extrapolations],
  align(center, image(figdir + "/competing_extrapolations_qm_ppt_en.svg", height: 225pt, fit: "contain")),
  caption: [At the two candidate boundaries, $sigma=1.75$ and $2.0$, $Q_m$ independently shows that neither visual linearity nor AICc selects a unique limit.])

== The _$R_p$_ intercept is not window-stable

#move(dy: -14pt, grid(
  columns: (520pt, 1fr),
  column-gutter: 18pt,
  align: horizon,
  figbox([Figure 5a · $R_p$ extrapolation-window stability],
    align(center, image(figdir + "/extrapolation_window_stability_rp_ppt_en.svg", width: 520pt, fit: "contain"))),
  [
    #align(left, text(size: 19pt)[
      $R_p = chevron.l R_2 chevron.r - 2 chevron.l R_0 chevron.r$
    ])
    #v(18pt)
    #align(left, text(size: 22pt, fill: pal.accent_deep)[
      $-2 <= R_p <= 1$
    ])
  ],
))

#v(8pt)
#rail_pull[A determined thermodynamic limit would remain stable as small sizes are removed. Instead, $R_(p,infinity)$ shifts strongly with the fit window, showing that the correction law—not the precision of individual Monte Carlo points—limits the inference.]

== The _$Q_m$_ intercept is not window-stable

#move(dy: -14pt, grid(
  columns: (520pt, 1fr),
  column-gutter: 18pt,
  align: horizon,
  figbox([Figure 5b · $Q_m$ extrapolation-window stability],
    align(center, image(figdir + "/extrapolation_window_stability_qm_ppt_en.svg", width: 520pt, fit: "contain"))),
  [
    #align(left, text(size: 19pt)[
      $Q_m = frac(chevron.l M^2 chevron.r^2, chevron.l M^4 chevron.r)$
    ])
    #v(18pt)
    #align(left, text(size: 22pt, fill: pal.accent_deep)[
      $0 <= Q_m <= 1$
    ])
  ],
))

#v(8pt)
#rail_pull[The measured $Q_m(L)$ values are precise, but they do not constrain a unique asymptotic limit. Removing small sizes makes the three-parameter extrapolation ill-conditioned, so the intercept drifts and its bootstrap interval can expand sharply.]

== Large-size _$R_p$_ fits remain _model-dependent_

#figbox([Figure 6a · Large-size $R_p$ points and full-window fits],
  align(center, image(figdir + "/extension_extrapolation_rp_ppt_en.svg", height: 225pt, fit: "contain")),
  caption: [Only $L=768,1024,1536,2048$ points are shown; full-window fits move the pathological $sigma=2.0$ power intercept from $R_(p,infinity)=3.06$ to $0.257$.])

#v(6pt)
#rail_pull[At $sigma=2$, larger sizes remove the worst power-fit pathology; $sigma=1.75$ remains ill-conditioned. At neither boundary do power and log agree.]

== Large-size _$Q_m$_ fits remain _model-dependent_

#figbox([Figure 6b · Large-size $Q_m$ points and full-window fits],
  align(center, image(figdir + "/extension_extrapolation_qm_ppt_en.svg", height: 225pt, fit: "contain")),
  caption: [Only $L=768,1024,1536,2048$ points are shown; $Q_(m,infinity)$ moves from $1.76$ to $0.922$, but power and log limits still disagree.])

#v(6pt)
#rail_pull[At both candidate boundaries, the large-size $Q_m$ points do not reconcile the power and logarithmic limits.]

= Discrimination and validation limits

== A longer ladder alone still misses _3σ_

#spread(
  figbox([Figure 7 · Distinguishable-size forecast],
    align(center, image(figdir + "/distinguishability_forecast_ppt_en.svg", height: 210pt)),
    caption: [Every registered observable and fit window remains below $3 sigma$ through $L=65536$.]),
  [
    #kicker[Conditional error budget]
    Included:
    - parameter-prediction covariance;
    - assumed future Monte Carlo standard error.

    Not included:
    - $beta_c$ systematics;
    - additional model-form uncertainty.

    #rail_pull[`>65536` is a planning result, not a claim about unmeasured physics.]
  ],
  ratio: (1.18fr, 0.82fr),
)

== The Clock cross-check identifies an _algorithmic limit_

#data_table(
  ("σ", "L", "Qm difference", "χ difference"),
  ("1.875", "64–256", "≤0.63σ", "≤0.45σ"),
  ("2.0", "64–256", "≤2.06σ", "≤2.16σ"),
  ("1.875", "512", "−3.21σ", "—"),
  ("2.0", "512", "−4.38σ", "—"),
  highlight: (2, 3),
)

#v(10pt)
#twocol(
  [Through $L=256$, Clock and FK sample compatible equilibrium physics.],
  [At $L=512$, the discrepancy coincides with $tau_"int" approx 8 times 10^3$, diagnosing local-update mixing failure.],
)

#rail_pull[An independent-algorithm comparison must audit autocorrelation, not only final means.]

= Conclusion

== An evidence-backed _inconclusive result_

#conclusion_grid(
  (label: "Validation", title: [Pipeline is credible], body: [The NN $eta=1/4$ control passes; critical points and finite-size drift are reproduced.]),
  (label: "Physics", title: [The flow is resolved], body: [$sigma=2.5$ reaches short-range anchors while $sigma <= 2$ retains strong corrections.]),
  (label: "Decision", title: [Boundary remains open], body: [Power/log and fit-window dependence prevent choosing $sigma^*=7/4$ or 2.]),
  (label: "Next", title: [Reduce corrections], body: [Improve $beta_c$ and joint fits; seek weak-correction observables or an improved Hamiltonian that suppresses leading finite-size corrections.]),
)

#v(12pt)
#rail_pull[The central result is not a selected boundary, but a quantitative account of why current scales cannot select one.]
