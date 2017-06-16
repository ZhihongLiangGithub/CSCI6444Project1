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
head(power_centrality(finalGraph,loops=FALSE,exponent = 0.5, rescale = 1, tol = 1e-07, sparse = TRUE))
#ego.(IDK WHAT IM DOING WITH 1:3 BUT IT'S SUPPOSED TO BE ORDER. PLZ LOOK INTO ORDER)
head(ego(finalGraph,1:3))
    ``