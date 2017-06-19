summary(finalGraph)
install.packages("igraph")
library(igraph)
#Total number of nodes
vcount(finalGraph)
#Average path length 
average.path.length(finalGraph,directed=TRUE,unconnected=TRUE)
#calculating the longest path
diameter(finalGraph)
farthest.nodes(finalGraph)
#calculate the largest clique in the network
largest_cliques(finalGraph)
#degree centrality for business network 
deg <- degree(finalGraph,loops=FALSE)
head(sort(deg,decreasing=TRUE))
#Closeness centrality
head(sort(closeness(finalGraph),decreasing = TRUE))
#betweenness centrality
head(sort(betweenness(finalGraph),decreasing = TRUE))
#power centrality
power<-power_centrality(finalGraph,loops=FALSE,exponent = 0.5, rescale = 1, tol = 1e-07, sparse = TRUE)
head(sort(power,decreasing = TRUE))
ego_graph3 <-make_ego_graph(graph = finalGraph, order =1, node = V(finalGraph)$name == "david.forster@enron.com", mode = c("all","out","in"), mindist=0)
plot(ego_graph3[[1]])
