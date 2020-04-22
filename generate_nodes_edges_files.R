setwd("E:/Class Notes/stats/project/Project/Dataset")
library("dplyr")

generate_nodes_edges_file <- function(filename) {
  network_df <- read.csv(paste(filename, "authors_network.csv", sep = "_"))
  
  authors_cip_df <- select(network_df, scopus_id, cip_category.x)
  names(authors_cip_df) <- c("scopus_id", "cip_title")
  
  co_authors_cip_df <- select(network_df, co_author_scopus_id, cip_category.y)
  names(co_authors_cip_df) <- c("scopus_id", "cip_title")
  
  nodes_df <- unique(rbind(authors_cip_df, co_authors_cip_df)) %>% write.csv(paste(filename, "nodes.csv", sep = "_"))
  
  edges_df <- network_df %>% select(scopus_id, co_author_scopus_id, eids)
  names(edges_df) <- c("Source", "Target", "Label")
  write.csv(edges_df, paste(filename, "edges.csv", sep="_"))
}


for (file in c("US")) {
  generate_nodes_edges_file(file)
}


