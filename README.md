# MANOVA with Discriminant Analysis Follow-Up

## Overview
This repository demonstrates a full multivariate inference workflow using a **one-way MANOVA** to evaluate group differences across multiple academic outcomes, followed by **canonical discriminant analysis** to identify which variables drive the multivariate effect.

The project emphasizes correct statistical decision-making, assumption checking, and interpretable follow-up analysis using R.

---

##  Research Question
Do tutoring methods differ in their impact on **reading, grammar, and writing scores** when evaluated simultaneously?

---

##  Analytical Approach
Rather than conducting multiple independent ANOVAs, this project applies a **multivariate omnibus test** to control Type I error and assess overall group differences before proceeding to follow-up analyses.

### Methods Used
- **Multivariate Omnibus Test:** One-way MANOVA (Pillai’s Trace)
- **Effect Size Estimation:** Partial η² derived from Pillai’s Trace
- **Assumption Diagnostics:**  
  - Multivariate normality via Mardia’s skewness and kurtosis  
- **Follow-Up Analysis:**  
  - Canonical discriminant analysis (structure coefficients)  
  - Univariate ANOVAs with multiplicity correction

---

## Key Analytical Steps
- Imported SPSS data into R for reproducible analysis
- Modeled multiple dependent variables jointly using MANOVA
- Computed group means to support substantive interpretation
- Estimated multivariate effect size from Pillai’s Trace
- Assessed multivariate normality assumptions
- Used discriminant analysis to identify variables contributing to group separation
- Conducted univariate follow-ups to confirm individual outcome effects

---

## Key Findings
- The MANOVA revealed a **statistically significant multivariate effect** of tutoring method.
- Discriminant analysis showed that **reading and grammar** were the primary contributors to group separation.
- Group means supported the directionality of the multivariate findings.
- After correcting for multiple comparisons, **reading remained statistically significant**, while grammar demonstrated a weaker effect.
- Assumption checks supported the validity of the multivariate model.

---

## Tools & Technologies
- **R**
- `foreign` (SPSS data import)
- `psych` (multivariate diagnostics)
- `candisc` (canonical discriminant analysis)
- Base R multivariate modeling functions

---

## Repository Structure
- `analysis/` – R scripts for MANOVA, diagnostics, and follow-ups  
- `results/` – Key outputs and summary tables  
- `report/` – Written interpretation of findings  

---

## Why This Project Matters
This project demonstrates:
- Appropriate use of **multivariate methods** over repeated univariate testing
- Thoughtful handling of **assumptions and effect sizes**
- Ability to translate statistical output into **clear, substantive conclusions**
- Reproducible analytical workflows using R

The analytical approach mirrors tasks common in **data analytics, behavioral research, consulting, and applied data science roles**.

---

## Skills Demonstrated
- Multivariate statistical modeling (MANOVA)
- Discriminant analysis interpretation
- Effect size estimation
- Assumption diagnostics
- Reproducible analysis in R
- Statistical communication for technical and non-technical audiences

