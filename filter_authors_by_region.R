setwd("E:/Class Notes/stats/project/Project/Dataset")
library("dplyr")

df <- (read.csv("brain_author.csv") %>% 
         select(scopus_id, num_publications, region, cip_title) %>% 
         filter(num_publications > 10 & region == "Australasia"))

colnames(df) <- c("author_scopus_id", "number_publications", "author_region", "cip_title")

write.csv(df, "Australasia_authors_more_than_10_pubs.csv", append = FALSE)