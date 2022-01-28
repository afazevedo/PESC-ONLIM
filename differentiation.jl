using ForwardDiff, LinearAlgebra

f(x::Vector) = sum(sin, x) + prod(tan, x) * sum(sqrt, x);
x = rand(5)
g = x -> ForwardDiff.gradient(f, x); # g = ∇f
ForwardDiff.hessian(f, x)
ForwardDiff.hessian(det, x)
