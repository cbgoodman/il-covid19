# Main File to Generate IL COVID-19 Graphics

# Load in required packages
source("./code/packages.r")

# Download required data
source("./code/download.r")

# Process incoming data
source("./code/process-data.r")

# Generate graphics
source("./code/il-covid-cases.r")
source("./code/il-covid-deaths.r")
source("./code/il-testing.r")
source("./code/dph-vaccine.r")
source("./code/dph-json-hospitalization.r")
source("./code/dph-json-county.r")
source("./code/dph-vaccine-county.r")
source("./code/dph-json-region.r")
source("./code/dph-json-county-heatmap.r")