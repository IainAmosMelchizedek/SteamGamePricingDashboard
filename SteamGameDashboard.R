# Clear console and environment
cat("\014")  # Clears the console
rm(list = ls())  # Clears the environment

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(readr)
library(shiny)
library(DT)

# Define file path and load the dataset
file_path <- "C:/ALY6110/EDA/Output_P2.csv"  # Update with correct path if necessary
dataset <- read_csv(file_path)

# Clean the dataset by removing rows with missing values
clean_data <- function(df) {
  df_clean <- na.omit(df)
  return(df_clean)
}

dataset_clean <- clean_data(dataset)

# Limit data to 2% for table display purposes
dataset_clean <- dataset_clean %>% sample_frac(0.02)

# Round the price column to two decimal places
dataset_clean$price <- round(dataset_clean$price, 2)

# Create Shiny Dashboard
ui <- fluidPage(
  titlePanel("Basic EDA: Steam Game Pricing"),
  
  sidebarLayout(
    sidebarPanel(
      # Slider input for price range with custom limits (Free to $75)
      sliderInput("price_range", "Select Price Range:",
                  min = 0,  # Free
                  max = 75,  # Maximum $75
                  value = c(0, 75),  # Set default range from Free to $75
                  step = 5,  # Move in $5 increments
                  ticks = TRUE),  # Display ticks on the slider
      
      # Dropdown menu to select a variable (only numeric columns)
      selectInput("variable", "Select Variable to Explore:",
                  choices = names(dataset_clean[sapply(dataset_clean, is.numeric)]))
    ),
    
    mainPanel(
      plotOutput("priceDistribution"),  # Using ggplot2 for static plot
      plotOutput("scatterPlot"),  # Using ggplot2 for static plot
      tableOutput("summaryStats"),
      dataTableOutput("dataPreview")  # Static table with reduced data
    )
  )
)

# Server logic
server <- function(input, output) {
  # Reactive expression to filter data based on price range
  filtered_data <- reactive({
    dataset_clean %>%
      filter(price >= input$price_range[1] & price <= input$price_range[2])
  })
  
  # Render the price distribution plot
  output$priceDistribution <- renderPlot({
    ggplot(filtered_data(), aes(x = price)) +
      geom_histogram(binwidth = 5, fill = "lightblue", color = "black") +
      labs(title = "Distribution of Prices", x = "Price", y = "Frequency") +
      theme_minimal()
  })
  
  # Render the scatter plot for correlation
  output$scatterPlot <- renderPlot({
    ggplot(filtered_data(), aes(x = price, y = .data[[input$variable]])) +
      geom_point(color = "darkblue", size = 2, alpha = 0.6) +
      labs(title = paste("Price vs", input$variable), x = "Price", y = input$variable) +
      theme_minimal()
  })
  
  # Render summary statistics with user-friendly labels
  output$summaryStats <- renderTable({
    summary_stats <- filtered_data() %>%
      summarise(
        `Average Price` = mean(price, na.rm = TRUE),
        `Median Price` = median(price, na.rm = TRUE),
        `Price Variability (Std Dev)` = sd(price, na.rm = TRUE),
        `Minimum Price` = min(price, na.rm = TRUE),
        `Maximum Price` = max(price, na.rm = TRUE)
      )
    
    summary_stats
  })
  
  # Render the data preview (with selected columns and limited rows)
  output$dataPreview <- renderDataTable({
    datatable(
      head(filtered_data() %>% 
             select(name, price, estimated_owners, peak_ccu, positive, negative, metacritic_score, achievements), 10),  # Show 8 columns, 10 rows
      options = list(
        pageLength = 5,  # Show 5 rows per page
        scrollX = TRUE,  # Allow horizontal scrolling
        autoWidth = TRUE  # Automatically adjust column width
      )
    )
  })
}

# Run the Shiny app
shinyApp(ui = ui, server = server)
