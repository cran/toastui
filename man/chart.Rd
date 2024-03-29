% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chart.R
\name{chart}
\alias{chart}
\title{Interactive charts}
\usage{
chart(
  data = list(),
  mapping = NULL,
  type = c("column", "bar", "area", "line", "scatter", "bubble", "boxPlot", "heatmap",
    "treemap", "radialBar", "pie", "gauge"),
  ...,
  options = list(),
  height = NULL,
  width = NULL,
  elementId = NULL
)
}
\arguments{
\item{data}{A \code{data.frame} if used with \code{mapping} otherwise a configuration \code{list}.}

\item{mapping}{Default list of aesthetic mappings to use for chart if \code{data} is a \code{data.frame}.}

\item{type}{Type of chart.}

\item{...}{Optional arguments (currently not used).}

\item{options}{A \code{list} of options for the chart.}

\item{height, width}{Height and width for the chart.}

\item{elementId}{An optional id.}
}
\value{
A \code{chart} htmlwidget.
}
\description{
Interactive charts
}
\examples{
library(toastui)

# Some data
mydata <- data.frame(
  month = month.name,
  value = sample(1:100, 12)
)

# Chart using mapping
chart(mydata, caes(x = month, y = value), type = "bar")

# Otherwise:
chart(
  data = list(
    categories = mydata$month,
    series = list(
      list(
        name = "Value", 
        data = mydata$value
      )
    )
  ),
  options = list(
    chart = list(title = "My title"),
    legend = list(visible = FALSE)
  ),
  type = "column"
)
}
\seealso{
\code{\link[=chartOutput]{chartOutput()}} / \code{\link[=renderChart]{renderChart()}} for usage in Shiny applications.
}
