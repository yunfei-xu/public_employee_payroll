main <- read.csv("main.csv", stringsAsFactors = FALSE)
main$annual = as.numeric(main$annual, na.action='ignore')
