using JuMP
import Ipopt
import Statistics

stock_data = [
    93.043 51.826 1.063
    84.585 52.823 0.938
    111.453 56.477 1.000
    99.525 49.805 0.938
    95.819 50.287 1.438
    114.708 51.521 1.700
    111.515 51.531 2.540
    113.211 48.664 2.390
    104.942 55.744 3.120
    99.827 47.916 2.980
    91.607 49.438 1.900
    107.937 51.336 1.750
    115.590 55.081 1.800
]

stock_returns = Array{Float64}(undef, 12, 3)
for i in 1:12
    stock_returns[i, :] =
        (stock_data[i+1, :] .- stock_data[i, :]) ./ stock_data[i, :]
end

r = Statistics.mean(stock_returns, dims = 1)
Q = Statistics.cov(stock_returns)

portfolio = Model(Ipopt.Optimizer)
set_silent(portfolio)
@variable(portfolio, x[1:3] >= 0)
@objective(portfolio, Min, x' * Q * x)
@constraint(portfolio, sum(x) <= 1000)
@constraint(portfolio, sum(r[i] * x[i] for i in 1:3) >= 50)
optimize!(portfolio)

objective_value(portfolio)