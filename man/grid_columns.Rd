% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grid-columns.R
\name{grid_columns}
\alias{grid_columns}
\title{Set columns options}
\usage{
grid_columns(
  grid,
  columns,
  header = NULL,
  ellipsis = NULL,
  align = NULL,
  valign = NULL,
  className = NULL,
  width = NULL,
  minWidth = NULL,
  hidden = NULL,
  resizable = NULL,
  defaultValue = NULL,
  formatter = NULL,
  escapeHTML = NULL,
  ignored = NULL,
  sortable = NULL,
  sortingType = NULL,
  onBeforeChange = NULL,
  onAfterChange = NULL,
  whiteSpace = NULL,
  ...
)
}
\arguments{
\item{grid}{A grid created with \code{\link[=datagrid]{datagrid()}}.}

\item{columns}{Name(s) of column in the data used in \code{\link[=datagrid]{datagrid()}}.}

\item{header}{The header of the column to be shown on the header.}

\item{ellipsis}{If set to true, ellipsis will be used for overflowing content.}

\item{align}{Horizontal alignment of the column content. Available values are 'left', 'center', 'right'.}

\item{valign}{Vertical alignment of the column content. Available values are 'top', 'middle', 'bottom'.}

\item{className}{The name of the class to be used for all cells of the column.}

\item{width}{The width of the column. The unit is pixel. If this value isn't set, the column's width is automatically resized.}

\item{minWidth}{The minimum width of the column. The unit is pixel.}

\item{hidden}{If set to true, the column will not be shown.}

\item{resizable}{If set to false, the width of the column will not be changed.}

\item{defaultValue}{The default value to be shown when the column doesn't have a value.}

\item{formatter}{The function that formats the value of the cell.
The return value of the function will be shown as the value of the cell.
If set to 'listItemText', the value will be shown the text.}

\item{escapeHTML}{If set to true, the value of the cell will be encoded as HTML entities.}

\item{ignored}{If set to true, the value of the column will be ignored when setting up the list of modified rows.}

\item{sortable}{If set to true, sort button will be shown on the right side
of the column header, which executes the sort action when clicked.}

\item{sortingType}{If set to 'desc', will execute descending sort initially
when sort button is clicked. Default to 'asc'.}

\item{onBeforeChange}{The function that will be called before changing the
value of the cell. If stop() method in event object is called, the changing will be canceled.}

\item{onAfterChange}{The function that will be called after changing the value of the cell.}

\item{whiteSpace}{If set to 'normal', the text line is broken by fitting to the column's width.
If set to 'pre', spaces are preserved and the text is broken by new line characters.
If set to 'pre-wrap', spaces are preserved, the text line is broken by fitting to the
column's width and new line characters. If set to 'pre-line', spaces are merged,
the text line is broken by fitting to the column's width and new line characters.}

\item{...}{Additional parameters.}
}
\value{
A \code{datagrid} htmlwidget.
}
\description{
Set options for one or several specific column.
}
\note{
Documentation come from \url{https://nhn.github.io/tui.grid/latest/Grid/}.
}
\examples{
library(toastui)

# New header label
datagrid(mtcars[, 1:5]) \%>\%
  grid_columns(columns = "mpg", header = "Miles/(US) gallon")

# Align content to right & resize
datagrid(mtcars[, 1:5]) \%>\%
  grid_columns(
    columns = "mpg",
    align = "left",
    resizable = TRUE
  ) \%>\%
  grid_columns(
    columns = "cyl",
    align = "left",
    resizable = TRUE
  )

# Hide a column
datagrid(mtcars[, 1:5]) \%>\%
  grid_columns(
    columns = "mpg",
    hidden = TRUE
  )


# Set options for 2 columns
datagrid(mtcars[, 1:5]) \%>\%
  grid_columns(
    columns = c("mpg", "cyl"),
    header = c("Miles/(US) gallon", "Number of cylinders")
  )


}
