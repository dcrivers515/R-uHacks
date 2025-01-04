
lubridate::date()
lubridate::today()

library(lubridate)
month(today())
month(today(), label = TRUE)
date()
today()

d <- "2025-01-04"
d2 <- ymd(d)

class(d)
class(d2)

Sys.Date()

# Sys.sleep(20) # puts R session to sleep for 20 seconds
 # important to put system to sleep when web scraping or site 
 # could see you as a bot and block your ip address




 