
# Student Performance Analysis Using R
# Week 2: Exploratory Data Analysis

# 1. Install and load packages
packages <- c("readr", "dplyr", "ggplot2")

for (p in packages) {
  if (!requireNamespace(p, quietly = TRUE)) {
    install.packages(p)
  }
  library(p, character.only = TRUE)
}

# 2. Import dataset
students <- read.csv(
  "student-mat.csv",
  sep = ";"
)

# 3. Inspect dataset
dim(students)
head(students)
str(students)
summary(students)

# 4. Check missing values
colSums(is.na(students))

# 5. Check duplicate records
sum(duplicated(students))

# 6. Summary statistics
students %>%
  summarise(
    Mean_Grade = mean(G3),
    Median_Grade = median(G3),
    SD_Grade = sd(G3),
    Mean_Age = mean(age),
    Mean_Absences = mean(absences)
  )

# 7. Study time visualization
ggplot(students, aes(x = factor(studytime))) +
  geom_bar(fill = "steelblue") +
  labs(
    title = "Students by Weekly Study Time",
    x = "Study Time Category",
    y = "Number of Students"
  ) +
  theme_minimal()

# 8. Final grade visualization
ggplot(students, aes(x = G3)) +
  geom_histogram(
    binwidth = 2,
    fill = "orange",
    color = "black"
  ) +
  labs(
    title = "Distribution of Final Grades",
    x = "Final Grade",
    y = "Frequency"
  ) +
  theme_minimal()

# 9. Age boxplot
ggplot(students, aes(y = age)) +
  geom_boxplot(fill = "seagreen") +
  labs(
    title = "Student Age Distribution",
    y = "Age"
  ) +
  theme_minimal()

# 10. Correlation analysis
cor(students$G2, students$G3,
    use = "complete.obs")

# End of Week 2 Analysis
