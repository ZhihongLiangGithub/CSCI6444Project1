library(igraph)
g <-graph.edgelist(as.matrix(newdf3), directed=TRUE)
x <-get.adjacency(g)
print(x)
