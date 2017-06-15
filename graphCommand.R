library(igraph)
graph.edgelist(as.matrix(newdf3), directed=TRUE)
get.adjacency(graph.edgelist(as.matrix(newdf3), directed=TRUE))