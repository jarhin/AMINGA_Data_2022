
library(here)
library(DBI)
library(readr)

# connections
con <- dbConnect(RSQLite::SQLite(), "../aminga_data.sqlite")

null_results <- dbSendQuery(con, statement = read_file("../records_views.sql"))

# close connection
dbDisconnect(con) 

setwd(here())
files <- list.files(pattern = "[.]Rmd$")

for (f in files) rmarkdown::render(f)

