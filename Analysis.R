# ============================================
# A46 Football Analysis Project
# Research Question: Do home teams score significantly more goals than away teams?
# ============================================

# Load required libraries
library(ggplot2)
library(dplyr)

# Data Exploration
cat("\n=== DATA SUMMARY ===\n")
cat("Total matches:", nrow(results), "\n")
cat("Date range:", min(results$date), "to", max(results$date), "\n")

# Calculate home and away goals
home_goals <- results$home_score
away_goals <- results$away_score

# Descriptive statistics
cat("\n=== DESCRIPTIVE STATISTICS ===\n")
cat("Home goals - Mean:", mean(home_goals, na.rm=TRUE), "SD:", sd(home_goals, na.rm=TRUE), "\n")
cat("Away goals - Mean:", mean(away_goals, na.rm=TRUE), "SD:", sd(away_goals, na.rm=TRUE), "\n")

# Create data frame for analysis
goals_data <- data.frame(
  goals = c(home_goals, away_goals),
  location = factor(rep(c("Home", "Away"), each=length(home_goals)))
)

# Visualization 1: Histogram of goal distribution
png("histogram_goals.png", width=800, height=600)
par(mfrow=c(1,2))
hist(home_goals, main="Home Goals Distribution", xlab="Goals", col="lightblue", breaks=20)
hist(away_goals, main="Away Goals Distribution", xlab="Goals", col="lightcoral", breaks=20)
dev.off()

cat("\nHistogram saved as histogram_goals.png\n")

# Visualization 2: Boxplot comparison
png("boxplot_comparison.png", width=800, height=600)
ggplot(goals_data, aes(x=location, y=goals, fill=location)) +
  geom_boxplot() +
  labs(title="Comparison of Home vs Away Goals in International Football",
       x="Match Location",
       y="Number of Goals Scored") +
  scale_fill_manual(values=c("Home"="lightblue", "Away"="lightcoral")) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, size=14, face="bold"))
dev.off()

cat("Boxplot saved as boxplot_comparison.png\n")

# Statistical Test: Two-sample t-test
cat("\n=== STATISTICAL TEST ===\n")
cat("Null Hypothesis (H0): Mean home goals = Mean away goals\n")
cat("Alternative Hypothesis (H1): Mean home goals > Mean away goals\n\n")

# Perform t-test
t_test_result <- t.test(home_goals, away_goals, alternative="greater")
print(t_test_result)

# Interpretation
cat("\n=== INTERPRETATION ===\n")
if(t_test_result$p.value < 0.05) {
  cat("The null hypothesis is REJECTED (p-value =", t_test_result$p.value, ")\n")
  cat("Conclusion: Home teams score significantly more goals than away teams.\n")
} else {
  cat("The null hypothesis is NOT REJECTED (p-value =", t_test_result$p.value, ")\n")
  cat("Conclusion: No significant difference between home and away goals.\n")
}

cat("\nAnalysis complete!\n")