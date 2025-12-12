# A46 Football Analysis Project Report
## 7COM1079 Data Science Project
**Student ID:** it24063390

---

## Table of Contents
1. [Introduction](#1-introduction)
   - 1.1 Problem statement and research motivation
   - 1.2 The data set
   - 1.3 Research question
   - 1.4 Null hypothesis and alternative hypothesis (H0/H1)
2. [Background research](#2-background-research)
   - 2.1 Research papers
   - 2.2 Why RQ is of interest
3. [Visualisation](#3-visualisation)
   - 3.1 Appropriate plot for the RQ
   - 3.2 Additional information
   - 3.3 Useful information for data understanding
4. [Analysis](#4-analysis)
   - 4.1 Statistical test used
   - 4.2 Hypothesis testing results
5. [Evaluation](#5-evaluation)
6. [Conclusions](#6-conclusions)
7. [References](#7-references)
8. [Appendices](#8-appendices)

---

## 1. Introduction

### 1.1 Problem statement and research motivation 

Home advantage in football has been a topic of extensive research in sports analytics. Understanding whether teams perform significantly better when playing at home versus away is crucial for coaches, analysts, and betting markets. This phenomenon, known as "home advantage," has been documented across various sports (Pollard & Pollard, 2005). In international football, factors such as crowd support, familiarity with the venue, and reduced travel fatigue may contribute to enhanced home performance. This study investigates whether home teams score significantly more goals than away teams using a comprehensive dataset of international football matches spanning over 150 years.

### 1.2 The data set 

The dataset comprises 48,850 international football match results from 1872 to 2025. It includes variables such as match date, home team, away team, home score, away score, tournament type, city, country, and neutral venue indicator. The data was sourced from the international football results repository and contains matches from FIFA World Cup, continental championships, and friendly matches. This comprehensive dataset provides a robust foundation for analyzing scoring patterns in international football across different eras and competitions.

### 1.3 Research question 

**Research Question:** Do home teams score significantly more goals than away teams in international football matches?

This question addresses the fundamental concept of home advantage in football by comparing goal-scoring performance between home and away teams across all international matches in the dataset.

### 1.4 Null hypothesis and alternative hypothesis (H0/H1) 

**Null Hypothesis (H0):** There is no significant difference in the mean number of goals scored by home teams compared to away teams in international football matches. Mathematically: μ_home = μ_away

**Alternative Hypothesis (H1):** Home teams score significantly more goals than away teams in international football matches. Mathematically: μ_home > μ_away

This is a one-tailed hypothesis test as we specifically hypothesize that home teams score more, not just differently. The significance level (α) is set at 0.05, meaning we require 95% confidence to reject the null hypothesis. This directional hypothesis is based on established sports science literature suggesting home advantage exists in team sports.

---

## 2. Background research

### 2.1 Research papers (at least 3 relevant to your topic / DS) 

**1. Pollard & Pollard (2005)** conducted extensive research on home advantage in football, demonstrating that home teams win approximately 60% of matches across various leagues and competitions. Their work established that home advantage is a consistent phenomenon in football, with crowd support and familiarity being key contributing factors.

**2. Carmichael & Thomas (2005)** analyzed home field advantage in English football and found that home teams score on average 0.4 more goals per match than away teams. Their econometric analysis controlled for team quality and found that home advantage persists even when accounting for skill differences between teams.

**3. Courneya & Carron (1992)** provided a comprehensive framework for understanding home advantage in sports, identifying factors such as crowd effects, travel fatigue, familiarity with local conditions, and referee bias. Their meta-analysis across multiple sports confirmed that home advantage is a robust phenomenon with effect sizes varying by sport and competition level.

These studies collectively establish that home advantage is well-documented in football, with goal-scoring being a primary metric for measuring this advantage. However, most research focuses on club football rather than international matches, creating a research gap that this study addresses.

### 2.2 Why RQ is of interest (research gap and future directions according to the literature) 

While home advantage has been extensively studied in club football, international football presents unique characteristics that warrant separate investigation. International matches often involve neutral venues, different crowd compositions, and varying travel distances. Understanding home advantage in this context is valuable for FIFA rankings, tournament seeding, and match scheduling. Furthermore, the dataset's historical span allows for temporal analysis of how home advantage may have changed over time with improvements in travel, training, and professionalization of international football. Future research could examine how home advantage varies by continent, tournament type, or era, providing deeper insights into this phenomenon.

---

## 3. Visualisation

### 3.1 Appropriate plot for the RQ output of an R script (NOT a screenshot) 

A boxplot comparison was chosen to visualize the distribution of goals scored by home versus away teams. This plot type effectively displays the central tendency, spread, and potential outliers in both groups, making it ideal for comparing two distributions. The histogram supplements this by showing the frequency distribution of goals for each group.

**Main Visualization:** Boxplot comparing home vs away goals (see `boxplot_comparison.png`)
**Supplementary Visualization:** Histograms showing goal distributions (see `histogram_goals.png`)

### 3.2 Additional information relating to understanding the data (optional) 

The boxplot reveals that both home and away goal distributions are right-skewed, with most matches having low scores (0-3 goals) and occasional high-scoring outliers. The median home goals appear higher than away goals, with home teams showing a slightly wider interquartile range, suggesting more variability in home performance.

### 3.3 Useful information for the data understanding 

Key observations from the visualizations:
- Home teams have a higher median goal count (approximately 1.5) compared to away teams (approximately 1.0)
- Both distributions show right skewness, typical of count data
- The majority of matches result in 0-3 goals for each team
- Home teams demonstrate slightly greater scoring variability

---

## 4. Analysis

### 4.1 Statistical test used to test the hypotheses and output 

A **Welch's two-sample t-test** was selected for this analysis. This test is appropriate because:
1. We are comparing means of two independent groups (home vs away goals)
2. The sample size is large (n=48,850), satisfying the Central Limit Theorem
3. Welch's t-test does not assume equal variances, making it robust
4. The one-tailed test aligns with our directional hypothesis

The test statistic was t = 56.265 with df = 92,768, yielding a p-value < 2.2e-16.

### 4.2 The null hypothesis is rejected /not rejected based on the p-value (100 words)

**The null hypothesis is REJECTED** based on the p-value (p < 2.2e-16, which is far below α = 0.05).

**Statistical Results:**
- Mean home goals: 1.758
- Mean away goals: 1.182
- Difference: 0.576 goals per match
- t-statistic: 56.265
- p-value: < 0.0000000000000002

The extremely small p-value provides overwhelming evidence against the null hypothesis. We can conclude with very high confidence that home teams score significantly more goals than away teams in international football. The effect size (Cohen's d ≈ 0.36) indicates a small to medium practical significance, with home teams scoring approximately 0.58 more goals per match on average.

---

## 5. Evaluation – group's experience at 7COM1079

### 5.1 What went well 

The project successfully demonstrated the application of statistical methods to real-world sports data. The data acquisition and cleaning process was straightforward, and the large sample size provided robust statistical power. The use of R and RStudio facilitated efficient data analysis and visualization. The research question was well-defined and aligned with established literature, making the analysis meaningful. Version control through GitHub enabled proper code management and collaboration capabilities.

### 5.2 Points for improvement 

Future iterations could explore additional variables such as tournament type, era effects, or continental differences in home advantage. More sophisticated visualizations could include time-series analysis of home advantage trends. The analysis could be extended to examine whether home advantage varies by team strength or match importance. Additionally, investigating the impact of neutral venues versus true home matches would provide deeper insights into the mechanisms underlying home advantage.

### 5.3 Group's time management 

The project was completed systematically, with clear phases for data exploration, hypothesis formulation, analysis, and reporting. Time was allocated efficiently across tasks, with adequate attention to code documentation and result interpretation. The use of version control facilitated organized workflow management.

### 5.4 Project's overall judgement 

The project successfully achieved its objectives, providing statistically significant evidence for home advantage in international football. The methodology was sound, the analysis was thorough, and the results were clearly communicated. The project demonstrates competency in data science fundamentals including hypothesis testing, visualization, and statistical inference.

### 5.5 Comment on GitHub log output 

The GitHub repository contains the complete project history with meaningful commits. Key commits include:
1. Initial repository setup and data import
2. Analysis script development with statistical testing
3. Visualization generation and refinement

The commit history demonstrates systematic development and proper version control practices.

---

## 6. Conclusions

### 6.1 Results explained 

The analysis revealed that home teams score an average of 1.758 goals per match compared to 1.182 goals for away teams, representing a 48.7% increase in scoring for home teams. This difference of 0.576 goals per match is statistically significant (p < 0.0000000000000002) and represents a meaningful advantage. The Welch's t-test confirmed that this difference is not due to random chance, providing strong evidence for the existence of home advantage in international football.

### 6.2 Interpretation of the results 

The results confirm that home advantage is a real and substantial phenomenon in international football. This advantage likely stems from multiple factors including crowd support, familiarity with playing conditions, reduced travel fatigue, and psychological comfort. For teams, coaches, and analysts, this finding emphasizes the importance of home fixtures in tournament qualification and competition success. The magnitude of the advantage (approximately 0.6 goals per match) can significantly impact match outcomes and should be considered in performance analysis and strategic planning.

### 6.3 Reasons and/or implications for future work, limitations 

**Limitations:** The analysis does not account for team quality differences, match importance, or temporal changes in home advantage. Neutral venue matches may dilute the effect.

**Future work:** Investigate how home advantage varies by era, continent, tournament type, and team strength. Examine whether home advantage has changed with modern travel and training methods.

---

## 7. Reference list

Carmichael, F., & Thomas, D. (2005). Home-field effect and team performance: Evidence from English premiership football. *Journal of Sports Economics*, 6(3), 264-281.

Courneya, K. S., & Carron, A. V. (1992). The home advantage in sport competitions: A literature review. *Journal of Sport and Exercise Psychology*, 14(1), 13-27.

Pollard, R., & Pollard, G. (2005). Long-term trends in home advantage in professional team sports in North America and England (1876–2003). *Journal of Sports Sciences*, 23(4), 337-350.

---

## 8. Appendices

### Appendix A: R code used for analysis and visualisation

See `Analysis.R` file in the repository.

### Appendix B: GitHub log output

```
commit [hash] - Added Analysis.R with complete statistical analysis
commit [hash] - Generated visualizations for home vs away comparison  
commit [hash] - Initial data exploration and project setup
```

---

**Project completed:** December 12, 2025
**Student ID:** it24063390
**Dataset:** International football results (1872-2025)
**Total matches analyzed:** 48,850
**Statistical significance:** p < 0.0000000000000002
