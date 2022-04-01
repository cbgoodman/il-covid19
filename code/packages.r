if (!require("pacman")) install.packages("pacman") # Install the pacman package if missing
pacman::p_load(tidyverse, 
               scales, 
               lubridate, 
               ggtext,
               jsonlite, 
               reshape2,
               viridis)