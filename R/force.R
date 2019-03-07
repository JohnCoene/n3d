#' Force Engineß
#'
#' Define the force engine to use.
#'
#' @param n3d An object of class \code{n3d} as returned by \code{\link{n3d}}.
#' @param engine Getter/setter for which force-simulation engine to use 
#' (\href{https://github.com/vasturiano/d3-force-3d}{d3} or \href{https://github.com/anvaka/ngraph.forcelayout}{ngraph}).
#'
#' @name engine
#' @export
n_force_engine <- function(n3d, engine = c("d3", "ngraph")){
  .test_n3d(n3d)
  n3d$x$forceEngine <- match.arg(engine)
  return(n3d)
}