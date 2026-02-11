# MANOVA with Discriminant Analysis Follow-Up
# Purpose:
#   - Run a one-way MANOVA (Pillai's Trace) on Reading, Grammar, Writing by tutoring Method
#   - Compute group means and an effect size based on Pillai's Trace
#   - Check multivariate normality (Mardia's test)
#   - Run canonical discriminant analysis (structure coefficients)
#   - Run univariate ANOVA follow-ups

# ----------------------------
# Packages
# ----------------------------
library(foreign)
library(psych)
library(candisc)

# ----------------------------
# Data import
# ----------------------------
# Place the SPSS file in a local folder named "data/" at the repo root.
# Example: data/tutoring_data.sav
tutoring_data <- read.spss(
  file = "data/tutoring_data.sav",
  to.data.frame = TRUE,
  use.value.labels = FALSE
)

# ----------------------------
# MANOVA
# ----------------------------
# Use explicit referencing instead of attach() to avoid variable masking issues.
Y <- cbind(tutoring_data$Reading, tutoring_data$Grammar, tutoring_data$Writing)

tutoring_manova <- manova(Y ~ as.factor(tutoring_data$Method))
manova_pillai <- summary(tutoring_manova, test = "Pillai")
manova_pillai

# Group means (by Method)
tapply(tutoring_data$Reading, tutoring_data$Method, mean, na.rm = TRUE)
tapply(tutoring_data$Grammar, tutoring_data$Method, mean, na.rm = TRUE)
tapply(tutoring_data$Writing, tutoring_data$Method, mean, na.rm = TRUE)

# ----------------------------
# Effect size (from Pillai's Trace)
# ----------------------------
# NOTE:
# Pillai's Trace value is typically the second column in summary(manova)$stats
# but indexing can vary. We extract by column name when possible.
stats_mat <- summary(tutoring_manova)$stats

# Try to grab Pillai by name; fall back to column 2 if needed.
pillai_val <- if ("Pillai" %in% colnames(stats_mat)) stats_mat[1, "Pillai"] else stats_mat[1, 2]
pillai_val

EtaSquaredPL <- function(PL, p, j, N) {
  ESPL <- PL / min(p, j - 1)
  1 - ((N - 1) / (N - max(p, j - 1) - 1) * (1 - ESPL))
}

p <- 3                      # number of dependent variables
j <- length(unique(tutoring_data$Method))  # number of groups
N <- nrow(tutoring_data)    # sample size

eta_sq_pillai <- round(EtaSquaredPL(pillai_val, p, j, N), 3)
eta_sq_pillai

# ----------------------------
# Assumption check: Mardia's test
# ----------------------------
# psych::mardia expects a numeric matrix/data frame
mardia_results <- psych::mardia(Y)
mardia_results

# ----------------------------
# Discriminant analysis follow-up
# ----------------------------
# candisc works from the manova object
cd <- candisc(tutoring_manova)
cd$structure  # structure coefficients (variable correlations with canonical dimension)

# ----------------------------
# Univariate follow-ups
# ----------------------------
univ_aov <- summary.aov(tutoring_manova)
univ_aov
