module StatisticTools

export weightedmean

"""
weightedmean(values::Array{Float64,1}, errors::Array{Float64,1})

computes the weighted mean of values, using as weights w = 1/ sigma^2
"""
function weightedmean(x::Array{Float64,1}, errors::Array{Float64,1}) 
    @assert length(x) == length(errors)
    weights = 1./ (errors.^2)
    sigma = sqrt( 1./ sum( weights ) )
    mean = sigma^2 * sum(x .* weights)

    mean, sigma
end

end # module
