using Plots

function plot_time(time_alg_1, time_alg_2, time_alg_3, qtd_assets)
        plot(qtd_assets, time_alg_1, xlim = [1,length(qtd_assets)], ylim = [0, 60], xticks=qtd_assets, xlabel = "Número de Ativos", ylabel = "Tempo",  lw = 2, title = "Tempo de execução dos algoritmos", label = "HOABB")
        plot!(qtd_assets, time_alg_2, xlabel = "Número de Ativos", ylabel = "Tempo",  lw = 2, label = "OA")
        plot!(qtd_assets, time_alg_3, xlabel = "Número de Ativos", ylabel = "Tempo",  lw = 2, label = "BHBB")
        savefig("tempo.png")
end

function return_risk(expected_return, risk_total)
        plot(expected_return, risk_total, xlim = [0, maximum(expected_return)], ylim = [0, 1], xlabel = "Retorno", ylabel = "Risco",  lw = 2, title = "Risco X Retorno", legend = false)
        savefig("risco-retorno.png")
end
