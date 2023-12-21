source(file = "global.R")
source(file = "packages.R")

ui <- fluidPage(
  
  titlePanel(titre_appli), 
  
  sidebarLayout(
    sidebarPanel(
      selectInput("select_input", 
                  "Choisissez une variable :", 
                  choices = variables_data)      
    ),
    mainPanel(
      tableOutput('variable')
    )
  )
)

server <- function(input, output){
  
  output$variable <- renderTable({
    tmp <- data %>% 
      select(input$select_input) 
    head(tmp)
  })
}

shinyApp(ui = ui, server = server)