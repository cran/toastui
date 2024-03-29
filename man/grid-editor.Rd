% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grid-editor.R
\name{grid-editor}
\alias{grid-editor}
\alias{grid_editor}
\alias{grid_editor_opts}
\title{Grid editor for columns}
\usage{
grid_editor(
  grid,
  column,
  type = c("text", "number", "checkbox", "select", "radio", "password"),
  choices = NULL,
  validation = validateOpts(),
  useListItemText = FALSE
)

grid_editor_opts(
  grid,
  editingEvent = c("dblclick", "click"),
  actionButtonId = NULL,
  session = shiny::getDefaultReactiveDomain()
)
}
\arguments{
\item{grid}{A table created with \code{\link[=datagrid]{datagrid()}}.}

\item{column}{Column for which to activate the editable content.}

\item{type}{Type of editor: \code{"text"}, \code{"number"}, \code{"checkbox"},
\code{"select"}, \code{"radio"} or \code{"password"}.}

\item{choices}{Vector of choices, required for \code{"checkbox"},
\code{"select"} and \code{"radio"} type.}

\item{validation}{Rules to validate content edited, see \code{\link[=validateOpts]{validateOpts()}}.}

\item{useListItemText}{If \code{choices} contains special characters (spaces, punctuation, ...)
set this option to \code{TRUE}, you'll have to encode data in \code{column} to numeric as character (e.g. \code{"1"}, \code{"2"}, ...).}

\item{editingEvent}{If set to \code{"click"}, editable cell in
the view-mode will be changed to edit-mode by a single click.}

\item{actionButtonId}{Use an \code{actionButton} inputId to send
edited data to the server only when this button is clicked.
This allows not to send all the changes made by the user to the server.}

\item{session}{Shiny session.}
}
\value{
A \code{datagrid} htmlwidget.
}
\description{
Allow to edit content of columns with different inputs,
then retrieve value server-side in shiny application with \verb{input$<outputId>_data}.
}
\examples{
library(toastui)
library(shiny)

ui <- fluidPage(
  tags$h2("Edit grid demo"),
  fluidRow(
    column(
      width = 6,
      tags$p(
        "Each time you modify the grid, data is send to server"
      ),
      datagridOutput("grid1"),
      verbatimTextOutput("edited1")
    ),
    column(
      width = 6,
      tags$p(
        "Modify the grid, then click button to send data to server"
      ),
      datagridOutput("grid2"),
      actionButton(
        inputId = "update2", 
        label = "Update edited data", 
        class = "btn-block"
      ),
      verbatimTextOutput("edited2")
    )
  )
)

server <- function(input, output, session) {
  
  # Use same grid twice
  editdata <- data.frame(
    character = month.name,
    select = month.name,
    checkbox = month.abb,
    radio = month.name
  )
  editgrid <- datagrid(editdata) \%>\% 
    grid_editor(
      column = "character",
      type = "text"
    ) \%>\% 
    grid_editor(
      column = "select",
      type = "select",
      choices = month.name
    ) \%>\% 
    grid_editor(
      column = "checkbox",
      type = "checkbox",
      choices = month.abb
    ) \%>\% 
    grid_editor(
      column = "radio",
      type = "radio",
      choices = month.name
    )
  
  output$grid1 <- renderDatagrid({
    editgrid
  })
  
  output$edited1 <- renderPrint({
    input$grid1_data
  })
  
  output$grid2 <- renderDatagrid({
    editgrid \%>\%
      grid_editor_opts(
        actionButtonId = "update2"
      )
  })
  
  output$edited2 <- renderPrint({
    input$grid2_data
  })
  
}

if (interactive())
  shinyApp(ui, server)
}
\seealso{
\code{\link{grid_editor_date}} for a date picker.
}
