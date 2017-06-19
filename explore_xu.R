library(igraph)
#Explore 3 functions in the igraph package
#generate a ring graph
g<-graph.ring(10)

# 1.get shortest path -- shortest.paths()
shortest.paths(g)
get.shortest.paths(g,5)

# 2.generate a random graph with a fix number of vertices and every possible edge is created with the same constant probability
g<-smple_gnp(10, 5/10) %du% sample_gnp(9, 5/9)

# 3.detect the community structure in networks and lable the vertices with unique labels
g <- add_edges(g, c(1, 12))
cluster_label_prop(g)
