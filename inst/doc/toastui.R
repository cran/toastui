## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = FALSE
)

## ----setup--------------------------------------------------------------------
#  library(toastui)

## ----grid---------------------------------------------------------------------
#  datagrid(rolling_stones_50)

## ----calendar-----------------------------------------------------------------
#  calendar(cal_demo_data())

## ----chart--------------------------------------------------------------------
#  chart(mtcars, caes(mpg, disp, color = cyl), type = "scatter")

