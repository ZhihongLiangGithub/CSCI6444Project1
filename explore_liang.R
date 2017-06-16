library(igraph)
#Explore 3 functions in the igraph package
#generate a random graph model
rg <- sample_gnm(n = 20, m = 50, directed = T)
l <- layout_with_fr(rg)

plot(rg, layout = l)

# 1. find mutual edges -- is.mutual()
murg <- delete.edges(rg, which(!is.mutual(rg)))
plot(murg, layout = l)

# 2. BFS search of a graph -- graph.bfs()
print(graph.bfs(rg, V(rg)[1], father = T, pred = T, succ = T))

# 3. DFS search of a graph -- graph.dfs()
print(graph.dfs(rg, V(rg)[1], father = T, pred = T, succ = T))
