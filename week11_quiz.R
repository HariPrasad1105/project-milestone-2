setwd("C:/Users/harip/Downloads")
library("dplyr")
library("MASS")

df <- read.csv("mtcarss.csv")

wilcox.test(df$mpg, df$cyl, paired = TRUE)