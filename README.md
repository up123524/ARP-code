# ARP-code
Trading Rules Evaluation and Portfolio Construction
This repository contains the R code I developed for my project, which formed the basis of my report on evaluating a series of simple trading rules. These rules were intended to assist investors with limited access to data in achieving consistent returns. The project was inspired by a research paper I analyzed, and this code implements and tests the trading rules discussed in that paper, ultimately evaluating their effectiveness in constructing a reliable portfolio.

Project Overview
The primary goal of this project was to replicate the results of the paper, which introduced simple trading rules designed for investors with constrained data access. My code evaluates the performance of these rules and applies them in creating portfolios. The trading strategies were tested on both original and synthetic datasets, assessing whether they could provide consistent returns across different time periods and market conditions.

Key Challenges
One of the main difficulties in this project was obtaining the original data used in the paper. Many of the sources were restricted or no longer available, which posed a significant obstacle. To overcome this, I employed two alternative approaches:

Using Alternative Datasets
Where possible, I validated and substituted alternative datasets that closely matched the patterns of the original data. In some cases, I adjusted the level of the data by using different assets with similar patterns of took underlyings minimizing the loss of information while ensuring the results remained valid.

Monte Carlo Simulations
When suitable alternative datasets were not available, I used Monte Carlo simulations to generate synthetic data. Although synthetic data has its limitations, it allowed me to approximate the market conditions and test the robustness of the trading rules.

Despite these challenges, I was able to successfully replicate the key results of the original paper, allowing for a meaningful evaluation of the trading rules.

Results and Insights
While the differences in time epochs affected the performance of portfolios constructed using these rules, the project provided valuable insights into market behavior and portfolio performance. In particular, I explored various markets and asset classes to create a diversified portfolio that performed well on key financial metrics, such as the Sharpe ratio.

Though the new portfolios didn’t always match the original paper's success in terms of returns, experimenting with different combinations of asset classes offered insights into creating robust, diversified portfolios that can perform well under varying market conditions.

Tools and Methods
Programming Language: R (primary language of choice for this project)
Key Techniques: EDA, data wrangling, trading rule analysis, portfolio optimization
Metrics Evaluated: Sharpe ratio, risk-adjusted returns, and other standard financial performance tests
Conclusion
This project demonstrates the feasibility of implementing simple trading rules for portfolio construction, even when original data sources are unavailable. Through the use of alternative datasets and synthetic data, I was able to successfully replicate and test the paper’s trading strategies. I enjoyed experimenting with different markets and asset classes, ultimately learning more about the importance of diversification and risk management in achieving consistent returns. Among my various approaches to predicting market movements including ARIMA and GARCH however, my most effective was an XGBoost implementation. Despite this any individual trading rule lose efficacy quickly over time horizons displaying the difficulty in predicting market movements. 
