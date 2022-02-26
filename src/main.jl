#= 
Trabalho da disciplina de Otimização Linear Não Inteira
Autor: Amanda Ferreira de Azevedo
Data: 04/02/2022
Professores: Marcia Fampa e Wendel Melo
=#

include("read_files.jl")
include("portifolio_model.jl")
include("print_solution.jl")
include("plots.jl")


function main(inst, plot_results)
    markets, r, Q = read_or_library(inst)
    expected_return = .0001368553
    u_inf = zeros(markets,1)
    u_sup = ones(markets,1)

    if plot_results
        tempo_alg_1 = []
        tempo_alg_2 = []
        tempo_alg_3 = []
        qtd_assets = [i for i in 1:markets]

        for K in qtd_assets
            tempo = solve_model(markets, expected_return, r, Q, K, "MRQ_BB_ALG", u_inf, u_sup)
            append!(tempo_alg_1, tempo)
            tempo = solve_model(markets, expected_return, r, Q, K, "MRQ_OA_ALG", u_inf, u_sup)
            append!(tempo_alg_2, tempo)
            tempo = solve_model(markets, expected_return, r, Q, K, "MRQ_BONMIN_HYBRID_ALG", u_inf, u_sup)
            append!(tempo_alg_3, tempo)
        end 
        plot_time(tempo_alg_1, tempo_alg_2, tempo_alg_3, qtd_assets)
    end 
end 

main("data\\port1.txt", true)
