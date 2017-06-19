g <- make_empty_graph(n = 6) %>%
  add_edges(c(1,2, 2,3, 3,4, 4,5, 5,6)) %>%
  set_edge_attr("color", value = "red") %>%
  add_edges(c(6,1), color = "green")
E(g)[[]]
plot(g)
