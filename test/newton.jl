f(x) = cos(x)
g(x) = -sin(x)
h(x) = -cos(x)

x = 2.0
x = OptimNewton.optimize_newton(x, f, g, h;
                                prints=false)

@test x ≈ π   rtol = 1e-4