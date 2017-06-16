library(igraph)
g <-graph.edgelist(as.matrix(newdf3), directed = TRUE)
x <-get.adjacency(g)
newGraph<- graph.adjacency(x, mode = "directed", weighted = TRUE)
newGraph <-simplify(newGraph, remove.multiple = TRUE, remove.loops = TRUE,
         edge.attr.comb = igraph_opt("edge.attr.comb"))
wei<-E(newGraph)$weight
mean(wei)
newGraph <-delete.edges(newGraph, which(E(newGraph)$weight<=23))
finalGraph<- delete.vertices(newGraph,which(degree(newGraph)<1))
plot(g)

