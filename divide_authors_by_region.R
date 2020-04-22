setwd("E:/Class Notes/stats/project/Project/Dataset")
library("dplyr")

authors_filter_df <- read.csv("brain_authors_filtered.csv")
pub_authors_df <- read.csv("brain_publication_authors.csv")

join_by_author_df <- inner_join(pub_authors_df, authors_filter_df, by="scopus_id")

join_by_co_author_df <- (inner_join(join_by_author_df, authors_filter_df, by=c("co_author_scopus_id" = "scopus_id")) %>% 
                           filter(scopus_id != co_author_scopus_id) %>%
                           select(scopus_id, eids, co_author_scopus_id, region.x, region.y, cip_category.x, cip_category.y))

us_network <- (join_by_co_author_df %>% 
                 filter(region.x=='US/Canada' & region.y=='US/Canada') %>% 
                 select(scopus_id, eids, co_author_scopus_id, cip_category.x, cip_category.y) %>%
                 write.csv("US_authors_network.csv", append = FALSE))

europe_network <- (join_by_co_author_df %>% 
                     filter(region.x=='Europe' & region.y=='Europe') %>%
                     select(scopus_id, eids, co_author_scopus_id, cip_category.x, cip_category.y) %>%
                     write.csv("Europe_authors_network.csv", append = FALSE))

Australasia_network <- (join_by_co_author_df %>% 
                          filter(region.x=='Australasia' & region.y=='Australasia') %>% 
                          select(scopus_id, eids, co_author_scopus_id, cip_category.x, cip_category.y) %>%
                          write.csv("US_authors_network.csv", append = FALSE))