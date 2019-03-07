# source https://github.com/MADStudioNU/lesmiserables-character-network

options(stringsAsFactors = FALSE)

# read data
edges <- read.csv("./data-raw/jean-complete-edge.csv", encoding = "UTF-8")
nodes <- read.csv("./data-raw/jean-complete-node.csv", encoding = "UTF-8")

names(nodes) <- tolower(names(nodes))
names(edges) <- tolower(names(edges))
nodes$description <- NULL
edges$type <- NULL

library(tidygraph)

COLORS <- c("#B1E2A3", "#98D3A5", "#328983", "#1C5C70", "#24C96B")

graph <- tbl_graph(
	nodes = nodes, 
	edges = edges
) %>%
	activate(nodes) %>% 
	mutate(
		out_degree = centrality_degree(mode = "out"),
		in_degree = centrality_degree(mode = "in"),
		authority = centrality_authority(),
		pagerank = centrality_pagerank(),
		components = group_components(type = "weak"),
		eigen = centrality_eigen(),
		group = group_walktrap(),
		color = scales::col_numeric(COLORS, domain = NULL)(out_degree),
		name = label,
		id = name
	) %>% 
	select(-label) %>% 
	igraph::as_data_frame("both")

nodes <- graph$vertices
edges <- graph$edges

edges$id <- NULL
edges$label <- NULL
names(edges) <- c("source", "target")

lesmis_nodes <- nodes
lesmis_edges <- edges

row.names(lesmis_edges) <- NULL

# save
usethis::use_data(
	lesmis_nodes, lesmis_edges, overwrite = TRUE
)