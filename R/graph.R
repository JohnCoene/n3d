#' Nodes and edges
#'
#' Set nodes and edges of the network
#' 
#' @param n3d An object of class \code{n3d} as returned by \code{\link{n3d}}.
#' @param nodes,edges Nodes and edges data.frames to add to the network.
#' @param ... Any column(s) from the \code{nodes} or \code{edges} to select, can be named.
#'
#' @examples
#' n3d() %>% 
#'   n_nodes(lesmis_nodes, id, name, color, value = out_degree) %>% 
#'   n_edges(lesmis_edges, source, target)
#'
#' @name graph
#' @export
n_nodes <- function(n3d, nodes, ...) {
  .test_n3d(n3d)
  n3d$x$data$nodes <- .select_as_list(nodes, ...)
  return(n3d)
}

#' @rdname graph
#' @export
n_edges <- function(n3d, edges, ...) {
  n3d$x$data$links <- .select_as_list(edges, ...)
  return(n3d)
}
