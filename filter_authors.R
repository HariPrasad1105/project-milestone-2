setwd("C:/r-assignments/ProjectDataset/")
library("dplyr")

df <- (read.csv("brain_author.csv") %>% 
         select(scopus_id, num_publications, region, cip_title) %>% 
         filter(num_publications > 10 & region == "US/Canada"))

colnames(df) <- c("author_scopus_id", "number_publications", "author_region", "cip_title")

write.csv(df, "US_authors_more_than_10_pubs.csv", append = FALSE)