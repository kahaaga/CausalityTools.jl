import StatsBase

x, y = rand(500), rand(500)

####################
# Single binnings
####################
single_binning = RectangularBinning(0.5)

@test causality(x, y, TransferOperatorGridTest(binning = single_binning, ηs = 5)) isa Array{Float64,0}
@test causality(x, y, TransferOperatorGridTest(binning = single_binning, ηs = 2:10)) isa Vector

####################################################################################################
# Multiple binnings (summarised to a single value per η using the `binning_summary_statistic`).
####################################################################################################
multiple_binnings = [RectangularBinning(n) for n in 3:5]

causality(x, y, TransferOperatorGridTest(binning = multiple_binnings, 
    binning_summary_statistic = StatsBase.mean, ηs = 1)) isa Array{Float64,0}

causality(x, y, TransferOperatorGridTest(binning = multiple_binnings, 
    binning_summary_statistic = StatsBase.mean, ηs = 2:10)) isa Vector
