using JuMP, AmplNLWriter, Statistics


function portfolio_model(markets, investment, expected_return, Q, r)
    portfolio = Model( ()->AmplNLWriter.Optimizer("muriqui") )

    open("muriqui_algorithm.opt", "w") do io
        write(io, "MRQ_ECP_ALG")
    end;

    # open("muriqui_params.opt", "w") do io
    #     write(io, "str in_nlp_solver MRQ_NLP_MOSEK\ndbl in_max_cpu_time 600.0\nint in_max_iterations 1000")
    # end;

    @variable(portfolio, x[1:markets] >= 0)

    @objective(portfolio, Min, x' * Q * x)

    @constraints(portfolio, begin
        sum(x) <= investment
        sum(r[i] * x[i] for i in 1:markets) >= expected_return
    end)

    optimize!(portfolio)
    return portfolio
end 



