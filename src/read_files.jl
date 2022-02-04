using DelimitedFiles

function read_stock(arq)
    m = Int(readdlm(arq)[1,1])
    n = Int(readdlm(arq)[1,2])
    investment = readdlm(arq)[1,3]
    expected_return = readdlm(arq)[1,4]
    
    stock = zeros(m,n)
    for i in 1:m
        for j in 1:n
            stock[i,j] = readdlm(arq)[i+1,j]
        end 
    end

    return stock, m, n, investment, expected_return
end
