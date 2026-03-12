; extends

(inline_formula "$" _* @inline_formula.inner "$") @inline_formula.outer

[
  (displayed_equation
    ["\\[" "$$"]  ; either \[ or $$
    _* @equation.inner
    ["\\]" "$$"])
  (math_environment
    . (_)  ; anchors against first named group, so matching starts from here
    _* @equation.inner
    (_) .)
] @equation.outer
