using DelimitedFiles

function read_or_library(file)
    assets = Int(readdlm(file)[1,1])

    r = Array{Float64}(undef, assets)
    Q = Array{Float64}(undef, assets, assets)

    for i in 1:assets
        r[i] = Float64(readdlm(file)[i+1,1])
    end 

    number_of_lines = countlines(file)
    for i in (assets + 2):number_of_lines
        k = readdlm(file)[i, 1]
        l = readdlm(file)[i, 2]
        Q[k, l] = readdlm(file)[i, 3]
    end

    return assets, r, Q
end 

function frontier(file)
    limites = []
    number_of_lines = countlines(file)
    for i in 1:number_of_lines
        append!(limites, readdlm(file)[i, 1])
    end 
    return limites
end