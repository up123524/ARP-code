portfolioPrices=as.xts(df[,c(1:12)])
View(portfolioPrices)
portfolioprices_recent<-port
portfolioReturns<-na.omit(ROC(portfolioPrices))

library(tibble)

df2<-read_csv("/Users/umar/Documents/Masters/data of AP Q1.csv")
df2<-df2[-122,]
df2<-df2 %<>% 
  mutate(Date= as.Date(Date, format= "%d/%m/%Y")) %>% rename(switching=swtich)
str(df2)
View(df2)
df2$Date <- as.POSIXct(df2$Date)
df2$Date <- rev(df2$Date)
df2<-data.frame(column_to_rownames(df2, var = "Date"))
df2<-Filter(function(x)!all(is.na(x)), df2)
df2 %>% mutate_if(is.character,as.numeric)
df2<-as.xts(df2)
storage.mode(df2) <- "numeric"



df2_port<-as.xts(df2$switching)
df2_rf<-as.xts(df2$RF.return)
df2_bench<-df2$index.return
benchmark_returns<-na.omit(ROC(df2_bench))
portfolio_returns<-na.omit(ROC(df2_port))
riskfree_returns<-na.omit(ROC(df2_rf))

CAPM.beta(portfolioReturns, df2_benchret, 0.035/252)
CAPM.jensenAlpha(portfolioReturns,  0.035/252)
SharpeRatio(portfolioReturns,Rf=mean(df2$RF), 0.035/252)
?SharpeRatio

table.AnnualizedReturns(portfolioReturns)

t.test(df2_portret,df2_benchret, mu=0, alt="two.sided",var.eq=F, paired=F)

rets.df2<-cbind(portfolio_returns, benchmark_returns, riskfree_returns)
charts.PerformanceSummary(rets.df2, main="P/L over time")

##the data frame df2 is an xts(extensible timeseries dataframe) containing all values from 
##question 1
df2_port<-as.xts(df2$switching) ##extracting specific strategies from dataframe
df2_rf<-as.xts(df2$RF.return)
df2_bench<-as.xts(df2$index.return)
benchmark_returns<-na.omit(ROC(df2_bench))##extracting rate of change to run test on return rates
portfolio_returns<-na.omit(ROC(df2_port))
riskfree_returns<-na.omit(ROC(df2_rf))
#2 tailed t-test formulated under the null hypothesis 
#H0:no significant difference in returns, if the difference is significant we can say
#if the strategy is statistically significantly better 
print(t.test(portfolio_returns,riskfree_returns, mu=0, alt="two.sided",var.eq=F, paired=F))
print(t.test(portfolio_returns,benchmark_returns, mu=0, alt="two.sided",var.eq=F, paired=F))

#######
##the data frame df is an xts(extensible timeseries dataframe) containing all values from 
df2_2017<-df2["2017-10-31 00:00:00/2022-10-31 00:00:00"]##Comparing over the same time period
df_2017<-df["2017-10-31 00:00:00/2022-10-31 00:00:00"]
df2_port<-as.xts(df2_2017$switching)
portfolio_returns<-na.omit(ROC(df2_port))##periodic returns of switching strategy 
##creating a subset of the indices provided
portfolioPrices=as.xts(df_2017[,c(1:5)])
#using an equally weighted portfolio
weight=c(0.2,0.2,0.2,0.2,0.2)
#Creating a matrix of returns of weighted portfolio as determined in question 2
portfolioReturns<-na.omit(ROC(portfolioPrices))##extracting rate of return of equities
portfolioReturns<-Return.portfolio(portfolioReturns, weights = weight) #equally weighted returns of equities
#2 tailed t-test formulated under the null hypothesis 
#H0:no significant difference in returns, if the difference is significant we can say
#if the strategy is statistically significantly better 
##portfolioReturns represents the equally weighted portfolio,portfolio returns represents switching strategy portfolio
print(t.test(portfolioReturns,portfolio_returns, mu=0, alt="two.sided",var.eq=F, paired=F))

#### relevant financial statistics from most interesting returns
portfolio_returns<-na.omit(ROC(df2_2017$switching)) ##index returns for group gathered data
portfolio_returns_van<-na.omit(ROC(df_2017$VANGD.IDX.TST.500.PRTF.))##index returns from coursework data
weights_opt=c(0,0,0.35,0.38,0.27) ##creating optimal portfolio returns
weight_minvar=c(0,0.13,0,0.6,0.27)##creating minimum variance returns
weights_equal<-c(1/5,1/5,1/5,1/5,1/5)
portfolio_equal_return<-Return.portfolio(na.omit(ROC(df_2017[,c(1:5)])), weights = weights_equal)
portfolio_returns_opt<-Return.portfolio(na.omit(ROC(df_2017[,c(1,2,3,11,10)])), weights=weights_opt)
portfolio_returns_minvar<-Return.portfolio(na.omit(ROC(df_2017[,c(1,2,3,11,10)])), weights=weight_minvar)
##create a benchmark for returns, use equal weights of of the 5 indices to simulate overall market movement
weight=c(1/5,1/5,1/5,1/5,1/5)
benchmark_prices<-df_2017[,c(1:5)]
benchmark_returns<-Return.portfolio(na.omit(ROC(benchmark_prices),weights=weight)
##risk free rate
rf_returns<-na.omit((df_2017$US.DOLLAR.1M.DEPOSIT..FT.RFV....MIDDLE.RATE/100)/12) ##risk free rate for sharpe ratio
rf_returns<-rf_returns[-1,]
rf<-mean(rf_returns)
##statistics
CAPM.beta(portfolio_returns, benchmark_returns, rf) ##how the portfolio moves with the market
CAPM.jensenAlpha(Ra=portfolio_returns, Rb=benchmark_returns,Rf=rf)##risk adjusted return w.r.t benchmark
SharpeRatio(portfolio_returns, Rf=rf)##risk adjusted return w.r.t the risk free rate

rets.df.main<-cbind(portfolio_equal_return,rf_returns,portfolio_returns_opt,portfolio_returns_minvar, portfolio_returns,portfolio_returns_van)
rets.df.main<-na.omit(rets.df.main)
View(rets.df.main)
charts.PerformanceSummary(rets.df.main, main="P/L over time")
View(df2_2017)


portfolios<-c("switching strategy", "Group chosen index", "Vanguard index", "Optimal Portfolio", "Minimum Variance Portfolio")
CAPM_Beta<-c("NA", "NA", 1.00751, 0.5606771, 0.2988652)
CAPM_JensonAlpha<-c(-0.03345262, 0.07035114, -0.000887786, 0.02319316, 0.02601698)
SharpeRatio_Std<-c(0.15090779, 0.15090777, 0.10569848, 0.12783520, 0.10429070)
df<-tibble(portfolios, CAPM_Beta,CAPM_JensonAlpha,SharpeRatio_Std)
View(df)

####Jenson

###Metrics Used
#CAPM Beta: How much the portfolio moves with the market.
##Jenson's Alpha: Used to represent excess return over a benchmark portfolio, we take a jensons alpha over 0.2 to be significant due to small sample size
##Sharpe Ratio: A risk adjusted rate of return representing excess return as a function of risk take ##a sharpe ratio over 1 is good

