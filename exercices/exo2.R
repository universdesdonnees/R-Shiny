library(shiny)

ui <- fluidPage(
  titlePanel("Basic widgets"),
  
  fluidRow(
    column(3,
           wellPanel(
             h3("Buttons"),
             actionButton("action", "Action"),
             br(),
             submitButton("Submit")
           ),
           wellPanel(
             h3("Date range"),
             dateRangeInput("dateRange", "Date range", start = "2017-06-21", end = "2017-06-21")
           ),
           wellPanel(
             h3("Radio buttons"),
             radioButtons("radio", "Radio buttons", choices = c("Choice 1", "Choice 2", "Choice 3"))
           )
    ),
    column(3,
           wellPanel(
             h3("Select box"),
             selectInput("select", "Select box", choices = c("Choice 1", "Choice 2", "Choice 3"))
           ),
           wellPanel(
             h3("File input"),
             fileInput("file1", "Choose CSV File", accept = ".csv"),
           ),
           wellPanel(
             h3("Sliders"),
             sliderInput("slider1", "Slider 1", min = 0, max = 100, value = 50),
             sliderInput("slider2", "Slider 2", min = 0, max = 100, value = c(25, 75))
           )
    ),
    column(3,
           wellPanel(
             h3("Single checkbox"),
             checkboxInput("checkbox1", "Choice A", value = TRUE)
           ),
           wellPanel(
             h3("Checkbox group"),
             checkboxGroupInput("checkboxGroup", "Checkbox group", 
                                choices = c("Choice 1", "Choice 2", "Choice 3"), 
                                selected = "Choice 1")
           ),
           wellPanel(
             h3("Date input"),
             dateInput("date", "Date input", value = "2014-01-01")
           )
    ),
    
    column(3,
           wellPanel(
             h3("Help text"),
             helpText("Note: help text isn't a true widget, but 
                      it provides an easy way to add text to accompany other widgets.")
           ),
           wellPanel(
             h3("Numeric input"),
             numericInput("numeric", "Numeric input", value = 1)
           ),
           wellPanel(
             h3("Text input"),
             textInput("text", "Text input", value = "")
           )
    )
  )
)


server <- function(input, output) {
  # Server logic
}

shinyApp(ui = ui, server = server)
