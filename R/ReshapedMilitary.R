msc <- data.frame(MSC)
str(msc)
summary(msc)
library("ggplot2")
order2018 <- msc[order(-msc$X2018),]

per_country <- subset(order2018,Type=="Country")

allcountries <- (per_country)

fix =reshape(allcountries,direction = "long", varying = list(names(allcountries)[5:63]),
        v.names = "Value",
        idvar=c("Name", "Code", "Type", "Indicator.Name"),
        timevar = "Year",
        times = 1960:2018)
getwd()
View(fix)


write.csv(fix, file = "MilitarySpendingFIX.xlsx")
