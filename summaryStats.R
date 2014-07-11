
###########################################
# Summary stats
# for Intervention Analysis of WA snowpack
# poster by Clark and Barry
# created: 07 July 2014
# last edited: 07 July 2014
###########################################

# load libraries
require(psych)
require(ggplot2)

# summary stats
describeBy(snow[,4:5], group=snow$Name)
# number of NSa in the SWE column
lapply(snow.list, function(x) sum(is.na(x$SWE)))

# dotplot for SWE, Depth, and Density
qplot(snow$SWE, snow$Name)
qplot(snow$Depth, snow$Name)
qplot(snow$Density, snow$Name)

# density plot for SWE, Depth, and Density
ggplot(snow, aes(SWE, color=Name)) +
    geom_density(alpha=0.2) +
    theme_bw() +
    theme(legend.position="none")
ggplot(snow, aes(Depth, color=Name)) +
    geom_density(alpha=0.2) +
    theme_bw() +
    theme(legend.position="none")
ggplot(snow, aes(Density, color=Name)) +
    geom_density(alpha=0.2) +
    theme_bw() +
    theme(legend.position="none")


# plot each snow course's time series
titlenames = unique(snow$Name)

# Loop over list of data frames and create plots
for (i in seq(titlenames)) {
    if(sum(snow.list[[i]]$SWE, na.rm=T) > 0)
    {plot(x=(snow.list[[i]]$Date),y=(snow.list[[i]]$SWE),main=titlenames[i],xlab="Date", ylab="SWE (mm)", type="l")}
}


#### END OF FILE ####
