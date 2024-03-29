% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chart-options.R
\name{chart_labs}
\alias{chart_labs}
\title{Chart labs}
\usage{
chart_labs(.chart, title = NULL, x = NULL, y = NULL)
}
\arguments{
\item{.chart}{A \code{chart} htmlwidget.}

\item{title}{Text for main title.}

\item{x}{Text for x-axis title.}

\item{y}{Text for y-axis title.}
}
\value{
A \code{chart} htmlwidget.
}
\description{
Chart labs
}
\examples{
chart(mtcars, caes(x = mpg, y = wt), type = "scatter") \%>\%
  chart_labs(
    title = "Main title",
    x = "X axis",
    y = "Y axis"
  )
}
