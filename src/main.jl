#= 
Trabalho da disciplina de Otimização Linear Não Inteira
Autor: Amanda Ferreira de Azevedo
Data: 04/02/2022
Professores: Marcia Fampa e Wendel Melo
=#

include("read_files.jl")
include("portifolio_model.jl")
include("print_solution.jl")

function main()
    stock_data, prices, markets, investment, expected_return = read_stock("data\\stock_data.txt")
    stock_returns = Array{Float64}(undef, prices, markets)

    for i in 1:size(stock_data, 1)-1
        for j in 1:size(stock_data, 2)
            stock_returns[i,j] = (stock_data[i+1, j] - stock_data[i,j])/stock_data[i,j]
        end 
    end 
    
    r = Statistics.mean(stock_returns, dims = 1)
    Q = Statistics.cov(stock_returns)

    portfolio = portfolio_model(markets, investment, expected_return, Q, r)

    print_solution(portfolio, markets, investment, expected_return, r)
end 


main()
