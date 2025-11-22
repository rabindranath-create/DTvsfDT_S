
library("rstudioapi") # Load rstudioapi package
setwd(dirname(getActiveDocumentContext()$path)) # Set working directory to source file location
getwd() # Check updated working directory



factors <- seq(0, 20, by = 0.5)

template <- readLines("main_template.R")

for (f in factors) {
  
  script_name <- paste0("main_script", f, ".R")
  
  new_script <- template
  new_script <- gsub("XFACTOR", f, new_script)
  new_script <- gsub("XX", f, new_script)
  new_script <- gsub("scriptX", paste0("script", f), new_script)
  
  writeLines(new_script, script_name)
  
  cat("Generated:", script_name, "\n")
}
