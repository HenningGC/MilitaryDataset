msc <- data.frame(MSC)
str(msc)
summary(msc)

library("ggplot2")

orderall = msc[order(-msc$X2018),]

pcountry = subset(orderall, Type == "Country")

rich5wide = head(pcountry, 5)

rich5long = reshape(rich5wide,
        direction = "long",
        varying = list(names(rich5wide)[5:63]),
        v.names = "Value",
        idvar=c("Name", "Code", "Type", "Indicator.Name"),
        timevar = "Year",
        times = 1960:2018)
ggplot(rich5long, aes(x = Year, y = Value, color=Name))+geom_qq()
