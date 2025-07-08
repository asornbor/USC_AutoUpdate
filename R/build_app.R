# Script to build the static site
library(rmarkdown)

build_site <- function() {
  cat("Building static site...\n")
  
  # Ensure docs directory exists (GitHub Pages will serve from here)
  if (!dir.exists("docs")) {
    dir.create("docs", recursive = TRUE)
  }
  
  # Render the main app (this is where the magic happens)
  tryCatch({
    rmarkdown::render(
      input = "app.Rmd",           # Your dashboard source file
      output_file = "index.html",   # What browsers will load
      output_dir = "docs",         # Where GitHub Pages looks
      quiet = FALSE                # Show detailed progress
    )
    
    cat("Site built successfully!\n")
    
  }, error = function(e) {
    cat("Error building site:", e$message, "\n")
    quit(status = 1)  # Tell GitHub Actions this step failed
  })
}

# Run the build
build_site()
