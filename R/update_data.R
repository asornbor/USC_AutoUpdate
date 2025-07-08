# Script to fetch and update your daily data
library(readr)
library(dplyr)
library(lubridate)

# Example: Replace this with your actual data source
# This could be:
# - API calls (REST APIs, web services)
# - Database queries (if database is accessible online)
# - Web scraping (public websites)
# - Reading from public URLs (CSV files hosted online)

update_data <- function() {
  cat("Starting data update...\n")  # Shows progress in GitHub Actions log
  
  # REPLACE THIS SECTION WITH YOUR DATA FETCHING CODE
  # Here are common patterns:
  
  # Option 1: If you have an API (most common)
  # library(jsonlite)
  # data <- fromJSON("https://api.example.com/data?key=YOUR_API_KEY")
  
  # Option 2: If you have a CSV URL (simple and reliable)
  # data <- read_csv("https://example.com/daily-data.csv")
  
  # Option 3: If you have a database (needs public access)
  # library(DBI)
  # con <- dbConnect(RSQLite::SQLite(), "your-database-url")
  # data <- dbGetQuery(con, "SELECT * FROM daily_table")
  
  # Option 4: Mock data for testing (what we'll use initially)
  data <- data.frame(
    date = Sys.Date(),                              # Today's date
    value = runif(10, 1, 100),                     # Random numbers
    category = sample(c("A", "B", "C"), 10, replace = TRUE),  # Random categories
    timestamp = Sys.time()                          # Exact time of update
  )
  
  # Save the data to CSV (your app will read this file)
  write_csv(data, "data/daily_data.csv")
  
  # Log success information
  cat("Data updated successfully at", as.character(Sys.time()), "\n")
  cat("Rows updated:", nrow(data), "\n")
}

# Run the update with error handling
tryCatch({
  update_data()
}, error = function(e) {
  cat("Error updating data:", e$message, "\n")
  quit(status = 1)  # Tells GitHub Actions the step failed
})
