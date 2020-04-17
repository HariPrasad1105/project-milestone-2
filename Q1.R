setwd("C:/r-assignments/ProjectDataset/")
library("dplyr")
library("data.table")


authors_scopus_id <- (read.csv("authors_more_than_10_pubs.csv") %>% 
                        select(scopus_id))


#data_table_authors_id <- data.table(authors_scopus_id)
#setkey(data_table_authors_id, scopus_id)

#scopus_id_contains <- function(scopus_id_new) {
#  return(nrow(data_table_authors_id[.(scopus_id_new), nomatch=0L]) == 1)
#}

source_df <- read.csv("brain_publication_authors.csv") %>% filter(scopus_id %in% authors_scopus_id)
destination_df <- source_df

colnames(source_df) <- c("eid", "source")
colnames(destination_df) <- c("eid", "destination")


source_destionation_df <- (merge(source_df, destination_df) %>% 
                             filter((source != destination)) %>% filter(scopus_id_contains(source)))

# filter(scopus_id_contains(source) & scopus_id_contains(destination))