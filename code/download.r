
# Read in state-level data from DPH json file
table <- fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetIllinoisCases")
stateDF <- as_tibble(table)

# Read in state-level hospitalization rates
hospitalization <- fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetHospitalUtilizationResults")

# Read in state-level vaccination data
vax <- fromJSON("https://idph.illinois.gov/DPHPublicInformation/api/COVIDExport/GetVaccineAdministration?countyname=")

# Read in county-level stats and vax rates
source("./code/download-county.r")
source("./code/download-county-vax.r")

# Regional Resurgence data
json <- fromJSON("http://idph.illinois.gov/DPHPublicInformation/api/covidexport/GetResurgenceData")
# Save region data
region_data <- as_tibble(json)