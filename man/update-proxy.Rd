% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/proxies.R
\name{update-proxy}
\alias{update-proxy}
\alias{n_nodes_p}
\alias{n_edges_p}
\alias{n_update_data_p}
\title{Update}
\usage{
n_nodes_p(proxy, nodes, ...)

n_edges_p(proxy, edges, ...)

n_update_data_p(proxy)
}
\arguments{
\item{proxy}{A proxy as returned by \code{\link{n3dProxy}}.}

\item{nodes}{Nodes and edges data.frames to add to the network.}

\item{...}{Any column(s) from the \code{nodes} or \code{edges} to select, can be named.}

\item{edges}{Nodes and edges data.frames to add to the network.}
}
\description{
Update nodes and edges without redrawing the whole network.
}
\details{
Add the respective nodes and edges using \code{n_nodes_p} and \code{n_edges_p} then 
execute the update with \code{n_update_data_p}.
}
\examples{
library(shiny)

ui <- fluidPage(
  actionButton("add", "add nodes"),
  n3dOutput("n3")
)

server <- function(input, output) {

  output$n3 <- renderN3d({
    n3d() 
  })

  observeEvent(input$add, {
    n3dProxy("n3") \%>\% 
      n_nodes_p(lesmis_nodes, id, name, color, value = out_degree) \%>\% 
      n_edges_p(lesmis_edges, source, target) \%>\% 
      n_update_data_p()
  })

}

if(interactive()) shinyApp(ui, server)

}
