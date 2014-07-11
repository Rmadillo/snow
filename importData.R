###########################################
# Import and clean data
# for Intervention Analysis of WA snowpack
# poster by Clark and Barry
# created: 07 July 2014
# last edited: 07 July 2014
###########################################

# read table directly from NRCS
# period of record SWE (mm) and depth (cm) values for WA
snow = read.table("http://www.wcc.nrcs.usda.gov/reportGenerator/view_csv/customMultipleStationReport,metric/monthly/state=%22WA%22%20AND%20network=%22SNOW%22|name/POR_BEGIN,POR_END:M|2,M|3,M|4,M|5/name,WTEQ::value,SNWD::value", header=F, skip=6, sep=",", fill=T, quote="", as.is=T, comment.char = "")

# rename columns
colnames(snow)=c("Date", "Name", "SWE", "Depth")

# convert NRCS dates to R dates
snow$Date = gsub("Feb ", "01-02-", snow$Date)
snow$Date = gsub("Mar ", "01-03-", snow$Date)
snow$Date = gsub("Apr ", "01-04-", snow$Date)
snow$Date = gsub("May ", "01-05-", snow$Date)
snow$Date = as.Date(snow$Date, "%d-%m-%Y")

# estimate snow density
snow$Density = snow$SWE / snow$Depth

# split all data into separate data frames by snow course ID
snow.list = split(snow, snow$Name)

# write out csv to use in other programs
write.csv(snow, "snow.csv")


#### END OF FILE ####
