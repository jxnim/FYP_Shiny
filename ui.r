library(shiny)

# Define UI for random distribution application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Stock Portfolio Optimization"),
  
  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the br()
  # element to introduce extra vertical spacing
  sidebarLayout(
    sidebarPanel(
      
      checkboxGroupInput("inCheckboxGroup",
                         "SGX Securities Industry Sector:",
                         c("All" = "all",
                           "Technology" = "technology",
                           "Telco" = "telco",
                           "Banking" = "banking",
                           "Oil and Gas" = "oilGas",
                           "Real Estate" = "realEstate",
                           "Food" = "food",
                           "Gaming" = "gaming")),
      
      
      
      #radioButtons("dist", "SGX Securities Sector:",
       #            c("All" = "all",
        #             "Telco" = "unif",
         #            "Banking" = "lnorm",
          #           "Exponential" = "exp")),
      br(),
      
      selectInput("methodSelect", "Select method:",
                  c("STI Index tracking" = "tracking",
                    "Customize Risk/Return" = "custom")),
      
      disable(sliderInput("return", "Return:",
                          min = 0, max = 20, value = 5)),
    
      sliderInput("n", 
                  "Number of observations:", 
                  value = 500,
                  min = 1, 
                  max = 1000)
    ),
    
    # Show a tabset that includes a plot, summary, and table view
    # of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Plot", plotOutput("plot")), 
                  tabPanel("Summary", verbatimTextOutput("summary")), 
                  tabPanel("Table", tableOutput("table"))
      )
    )
  )
))

