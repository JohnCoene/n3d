#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#' @import dplyr
#'
#' @export
n3d <- function(control = "trackball", renderer = list(aplha = TRUE), width = "100%", height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    config = list(
      controlType = control,
      rendererConfig = renderer
    ),
    data = list(
      nodes = list(),
      links = list()
    )
  )

  # get n3d options
  opts <- options()
  n3d_opts <- opts[grepl("n3d", names(opts))]
  names(n3d_opts) <- gsub("n3d_", "", names(n3d_opts))

  # append
  x <- append(x, n3d_opts)

  # create widget
  htmlwidgets::createWidget(
    name = 'n3d',
    x,
    width = width,
    height = height,
    package = 'n3d',
    elementId = elementId
  )
}

#' Shiny bindings for n3d
#'
#' Output and render functions for using n3d within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a n3d
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name n3d-shiny
#'
#' @export
n3dOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'n3d', width, height, package = 'n3d')
}

#' @rdname n3d-shiny
#' @export
renderN3d <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, n3dOutput, env, quoted = TRUE)
}
