# ARP-code
Trading Rules Evaluation and Portfolio Construction
This repository houses the R code developed for my project, forming the foundation of my report on evaluating a series of strategic trading rules aimed at investors with limited data access. Inspired by a pivotal research paper, this code rigorously tests and implements the trading rules discussed in the study, evaluating their potential for constructing a reliable, high-performance portfolio.

Project Overview
The project’s primary objective was to replicate and build upon the findings of the original research, which introduced trading strategies designed for data-constrained investors. My approach not only evaluates the rules' performance across various conditions but also applies these strategies to create optimized portfolios tested on both historical and synthetic datasets, assessing their resilience across different market environments and time periods.

Key Challenges
A significant challenge was acquiring the original data from the paper, as many sources were restricted or unavailable. I adopted a two-pronged approach to address this:

Alternative Datasets: When possible, I sourced and validated alternative datasets with similar underlying patterns to the original data, substituting assets that closely matched these trends. This careful substitution minimized data discrepancies, preserving the project’s analytical integrity.

Monte Carlo Simulations: When alternative data wasn’t available, I utilized Monte Carlo simulations to generate synthetic datasets. Though synthetic data has inherent limitations, this method enabled me to approximate market dynamics effectively, ensuring the robustness of the trading rules under simulated conditions.

Despite these challenges, I successfully replicated the original results, facilitating a comprehensive evaluation of each trading rule’s reliability.

Methods for Predicting Market Movements
To predict market trends and construct portfolios, I employed an array of statistical and machine learning techniques. Among these, XGBoost, a high-performing ensemble method, outshone traditional models by consistently yielding superior predictive accuracy. Additionally, I explored advanced time-series forecasting models, including ARIMA and GARCH, to capture market volatility. However, XGBoost's adaptability and strong predictive power positioned it as the optimal choice, enhancing the precision of market movement predictions and portfolio returns.

Results and Insights
While portfolios constructed using these rules exhibited sensitivity to different time periods and market phases, the project yielded critical insights into portfolio performance and diversification strategies. By analyzing various asset classes and markets, I achieved portfolios with enhanced resilience and competitive Sharpe ratios, emphasizing the importance of diversification and risk management.

Although the replicated portfolios didn’t fully match the original paper’s returns, experimenting with asset combinations provided valuable perspectives on building robust portfolios capable of withstanding fluctuating market conditions. This analysis confirmed the need for dynamic strategies, as individual trading rules tend to lose efficacy over extended horizons, underscoring the inherent complexity of market prediction.

Tools and Techniques
Programming Language: R (primary language for implementation and analysis)
Key Techniques: Exploratory Data Analysis (EDA), data wrangling, trading rule evaluation, portfolio optimization
Metrics Evaluated: Sharpe ratio, risk-adjusted returns, and financial performance benchmarks
Conclusion
This project showcases the feasibility of constructing portfolios using accessible trading rules, even in the absence of original data sources. By integrating alternative datasets, synthetic data, and advanced machine learning models, I achieved meaningful validation and testing of the paper’s trading strategies. Experimenting with diverse markets and techniques enriched my understanding of risk management and the challenges of consistent return generation.
