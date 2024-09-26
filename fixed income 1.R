library(dplyr); library(xts); library(tseries)
library(sde)
library(outliers)

##read in 
path="/Users/umar/Documents/Masters/fi.csv"
df<-read.csv(path)
df<-df[-c(1:10),] %>% rename(date=Euro.6.Month.EURIBOR...Price.History..........................................01.Nov.2022.22.57)

##View
View(df)
str(df)
View(df[duplicated(col(df)),])

###formating
df$date <- as.Date(df$date, format = "%d-%b-%Y")
df$date<- format(df$date, format= "%Y/%m/%d")
df$date<-as.Date(df$date)
df$date<-as.POSIXct(df$date)
rownames(df)<-NULL
df<-df[!duplicated(df$date),]
df<-na.omit(df)
df<-data.frame(column_to_rownames(df, var="date"))
df<- df %>% mutate_if(is.character, as.numeric)
df<-as.xts(df)

##first difference
df_diff<-diff(df) %>% na.omit()
View(df_diff)

##adf test
adf_test<-adf.test(df)
print(adf_test)

##adf test differences
adf_test_diff<-adf.test(df_diff)
print(adf_test_diff)

par(mfrow=c(2,1))
ts.plot(df)
ts.plot(df_diff)

##intial look
ts<-ts(df, frequency = 1000)
components<-decompose(ts)
plot(components)

##fit mean reversion
reversion_level<-arima(df$X)
print(reversion_level)

df2<-data.frame(df[,-1])
View(df2)
outliers<- data.frame(quantile(df2, .75) + 1.5 * IQR(df2))
View(outliers)







