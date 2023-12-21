
library(shiny)

ui <- fluidPage(
  
  titlePanel("My Shiny App"),
  
  fluidRow(
    sidebarLayout(
      sidebarPanel(
        h1("Installation"),
        p("Shiny is available on CRAN, so you can install it in the usual way from your R console:"),
        code("install.packages(\"shiny\")"),
        br(),
        br(),
        img(src = "rstudio.png", height = "100px"),
        p('Shiny is a product of', 
          a(href = "https://posit.co/download/rstudio-desktop/", 'RStudio'))
      ),
      mainPanel(
        h1("Introducing Shiny"),
        p("Shiny is a new package from RStudio that makes it",em("incredibly easy"),
          "to build interactive web applications with R."),
        p("For an introduction and live examples, visit the", 
          a(href = "https://shiny.posit.co/","Shiny homepage.")),
        h2("Features"),
        p("- Build useful web applications with only a few lines
          of code—no JavaScript required."),
        p("- Shiny applications are automatically 'live' in the same way
              that", strong("spreadsheets"), "are live. Outputs change instantly as users modify inputs, 
              without requiring a reload of the browser.")
      )
    )
  )
)

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server)



