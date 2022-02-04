function print_solution(portfolio, markets, investment, expected_return, r)
    time_elapsed = solve_time(portfolio)
    println("A solução foi encontrada em $time_elapsed segundos")
    println("O retorno esperado é de pelo menos $expected_return")
    return_total = 0
    for i in 1:markets 
        return_total += r[i] * value(x[i])
        invest_market = value(x[i])
        println("A quantidade investida no mercado $i é de $invest_market")
    end
    println("O retorno obtido no mês é de $return_total")
end