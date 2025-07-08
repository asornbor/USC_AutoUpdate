# Install required packages
packages <- c(
  "rmarkdown",      # Converts .Rmd files to HTML
  "flexdashboard",  # Creates dashboard layouts
  "plotly",         # Interactive plots
  "DT",            # Interactive tables
  "crosstalk",     # Links widgets together
  "htmlwidgets",   # Framework for interactive widgets
  "readr",         # Fast CSV reading
  "dplyr",         # Data manipulation
  "lubridate"      # Date/time handling
  # Add your specific packages here
)

# Only install packages that aren't already installed (saves time)
new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) {
  install.packages(new_packages, repos = "https://cran.rstudio.com/")
}

cat("All packages installed successfully!\n")  # Confirms success in the log
