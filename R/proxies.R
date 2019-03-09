#' Update
#'
#' Update nodes and edges without redrawing the whole network.
#'
#' @param proxy A proxy as returned by \code{\link{n3dProxy}}.
#' @inheritParams graph
#'
#' @details Add the respective nodes and edges using \code{n_nodes_p} and \code{n_edges_p} then 
#' execute the update with \code{n_update_data_p}.
#'
#' @examples
#' library(shiny)
#' 
#' ui <- fluidPage(
#'   actionButton("add", "add nodes"),
#'   n3dOutput("n3")
#' )
#' 
#' server <- function(input, output) {
#' 
#'   output$n3 <- renderN3d({
#'     n3d() 
#'   })
#' 
#'   observeEvent(input$add, {
#'     n3dProxy("n3") %>% 
#'       n_nodes_p(lesmis_nodes, id, name, color, value = out_degree) %>% 
#'       n_edges_p(lesmis_edges, source, target) %>% 
#'       n_update_data_p()
#'   })
#' 
#' }
#' 
#' if(interactive()) shinyApp(ui, server)
#'
#' @name update-proxy
#' @export
n_nodes_p <- function(proxy, nodes, ...) {
  .text_proxy(proxy)
  data <- .select_as_list(nodes, ...)
  proxy$message$data$nodes <- data
	return(proxy)
}

#' @rdname update-proxy
#' @export
n_edges_p <- function(proxy, edges, ...) {
  .text_proxy(proxy)
  data <- .select_as_list(edges, ...)
	proxy$message$data$links <- data
	return(proxy)
}

#' @rdname update-proxy
#' @export
n_update_data_p <- function(proxy) {
  .text_proxy(proxy)
  proxy$message$id <- proxy$id

  if(!length(proxy$message$data$links))
    proxy$message$data$links <- list()

  if(!length(proxy$message$data$nodes))
    proxy$message$data$nodes <- list()

	proxy$session$sendCustomMessage("n_update_data_p", proxy$message)
	return(proxy)
}

n_append_data_p <- function(proxy) {
  .text_proxy(proxy)
  proxy$message$id <- proxy$id

  if(!length(proxy$message$data$links))
    proxy$message$data$links <- list()

  if(!length(proxy$message$data$nodes))
    proxy$message$data$nodes <- list()

	proxy$session$sendCustomMessage("n_append_data_p", proxy$message)
	return(proxy)
}

