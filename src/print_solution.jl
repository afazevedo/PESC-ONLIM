function print_solution(portfolio, markets, expected_return, r, x)
    time_elapsed = solve_time(portfolio)
    println("A solução foi encontrada em $time_elapsed segundos")
    println("O retorno esperado é de pelo menos $expected_return")
    return_total = 0
    return_expected = []
    for i in 1:markets 
        return_total += r[i] * value(x[i])
        append!(return_expected, r[i] * value(x[i]))
        invest_market = value(x[i])
        if invest_market > 0.0001
            println("O investidor $i investiu $invest_market em $i")
        end
    end
    println("O retorno obtido no mês é de $return_total")
    return return_total 
end