# Chargement des packages
library(shiny)
library(questionr)
library(DT)
library(ggplot2)

# Chargement des données
data(hdv2003, package = "questionr")

ui <- fluidPage(
  titlePanel("Analyse des Données hdv2003"),
  
  sidebarLayout(
    sidebarPanel(
      # Widgets pour le filtrage des données
      helpText("Sélectionnez un sexe et ajustez la tranche d'âge pour filtrer les données.
               Les graphiques et statistiques se mettront à jour automatiquement en fonction de vos sélections."),
      selectInput("sexe", "Sexe", choices = c("Tous","Homme","Femme")),
      sliderInput("ageRange", "Tranche d'âge", min = min(hdv2003$age, na.rm = TRUE), 
                  max = max(hdv2003$age, na.rm = TRUE), 
                  value = c(min(hdv2003$age, na.rm = TRUE),
                            max(hdv2003$age, na.rm = TRUE))),
    ),
    mainPanel(
      helpText("Utilisez les contrôles pour filtrer les données et visualiser les statistiques."),
      br(),
      dataTableOutput("tableData"),
      br(),
      plotOutput("plot"),
      br(),
      verbatimTextOutput("stats")
    )
  )
)

server <- function(input, output) {
  
  # Filtrage des données
  filteredData <- reactive({
    data <- hdv2003
    if (input$sexe != "Tous") {
      data <- data[data$sexe == input$sexe, ]
    }
    data <- data[data$age >= input$ageRange[1] & data$age <= input$ageRange[2], ]
    data
  })
  
  # Affichage des données filtrées
  output$tableData <- renderDataTable({
    DT::datatable(filteredData())
  })
  
  # Visualisation graphique
  output$plot <- renderPlot({
    ggplot(filteredData(), aes(x = age)) +
      geom_histogram(binwidth = 1, fill = "blue", color = "black") +
      theme_minimal() +
      labs(title = "Histogramme de l'âge", x = "Âge", y = "Fréquence")
  })
  
  # Résumé statistique
  output$stats <- renderPrint({
    data <- filteredData()
    if (nrow(data) > 0) {
      stats <- summary(data$age)
      print(stats)
    } else {
      print("Aucune donnée à afficher.")
    }
  })
}

shinyApp(ui = ui, server = server)


