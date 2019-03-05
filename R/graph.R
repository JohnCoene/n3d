#' Add nodes and edges
#'
#' @export
n_nodes <- function(n3d, data, ...) {
  .test_n3d(n3d)
  n3d$x$data$nodes <- data %>% 
    select(...) %>% 
    apply(1, as.list)
  return(n3d)
}

#' @export
n_edges <- function(n3d, data, ...) {
  n3d$x$data$links <- data %>% 
    select(...) %>% 
    apply(1, as.list)
  return(n3d)
}