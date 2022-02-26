using JuMP, AmplNLWriter, Statistics


# markets, r, Q = read_or_library("data\\stock_data.txt")
# expected_return = 0.05
# K = length(markets)
# u_inf = [0,0,0]
# u_sup = [1,1,1]

# portfolio = Model( ()->AmplNLWriter.Optimizer("muriqui") )
# open("muriqui_algorithm.opt", "w") do io
#     write(io, algorithm)
# end;

# # open("muriqui_params.opt", "w") do io
# #     write(io, "str in_nlp_solver MRQ_NLP_MOSEK\ndbl in_max_cpu_time 600.0\nint in_max_iterations 1000")
# # end;

# @variable(portfolio, x[1:markets] >= 0)
# @variable(portfolio, z[1:markets], Bin)

# @objective(portfolio, Min, x' * Q * x)

# @constraints(portfolio, begin
#     sum(x[i] for i in 1:markets) == 1
#     sum(r[i] * x[i] for i in 1:markets) >= expected_return
#     sum(z[i] for i in 1:markets) == K
#     limited_bellow[i in 1:markets], x[i] >= z[i]*u_inf[i] 
#     limited_above[i in 1:markets], x[i] <= z[i]*u_sup[i]
# end)

# optimize!(portfolio)

function solve_model(markets, expected_return, r, Q, K, algorithm, u_inf, u_sup)
    portfolio = Model( ()->AmplNLWriter.Optimizer("muriqui") )
    open("muriqui_algorithm.opt", "w") do io
        write(io, algorithm)
    end;

    open("muriqui_params.opt", "w") do io
        write(io, "dbl in_max_cpu_time 60.0")
    end;

    @variable(portfolio, x[1:markets] >= 0)
    @variable(portfolio, z[1:markets], Bin)

    @objective(portfolio, Min, x' * Q * x)

    @constraints(portfolio, begin
        sum(x[i] for i in 1:markets) == 1
        sum(r[i] * x[i] for i in 1:markets) >= expected_return
        sum(z[i] for i in 1:markets) == K
        limited_bellow[i in 1:markets], x[i] >= z[i]*u_inf[i] 
        limited_above[i in 1:markets], x[i] <= z[i]*u_sup[i]
    end)
    optimize!(portfolio)
    # print_solution(portfolio, markets, expected_return, r, x)
    # tempo = solve_time(portfolio)

    if termination_status(portfolio) == MOI.LOCALLY_SOLVED
        opt = objective_value(portfolio)
        tempo = solve_time(portfolio)
    elseif termination_status(portfolio) == MOI.LOCALLY_INFEASIBLE
        opt = 1
        tempo = -1
    else 
        opt = 1
        tempo = solve_time(portfolio)
    end
    
    return tempo
end









