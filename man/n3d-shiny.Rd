% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/n3d.R
\name{n3d-shiny}
\alias{n3d-shiny}
\alias{n3dOutput}
\alias{renderN3d}
\alias{n3dProxy}
\title{Shiny bindings for n3d}
\usage{
n3dOutput(outputId, width = "100\%", height = "400px")

renderN3d(expr, env = parent.frame(), quoted = FALSE)

n3dProxy(id, session = shiny::getDefaultReactiveDomain())
}
\arguments{
\item{outputId}{output variable to read from}

\item{width, height}{Must be a valid CSS unit (like \code{'100\%'},
\code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
string and have \code{'px'} appended.}

\item{expr}{An expression that generates a n3d}

\item{env}{The environment in which to evaluate \code{expr}.}

\item{quoted}{Is \code{expr} a quoted expression (with \code{quote()})? This
is useful if you want to save an expression in a variable.}

\item{id}{Id of visualisation.}

\item{session}{Your shiny session.}
}
\description{
Output and render functions for using n3d within Shiny
applications and interactive Rmd documents.
}
