setwd("E:/Class Notes/stats/project/Project/Dataset")
library("dplyr")

authors_df <- read.csv("brain_author.csv")
cip_titles_df <- read.csv("CIP_category.csv")

authors_cip_title_join_df <- inner_join(authors_df, cip_titles_df, by=c("cip_title" = "cip_name"))

(authors_cip_title_join_df %>% 
    filter(num_publications > 10 & 
             (region == 'US/Canada' | region == 'Europe' | region == 'Australasia' )) %>%
    select(scopus_id, num_publications, region, cip_title, cip_title, cip_category) %>%
    write.csv("brain_authors_filtered.csv"))