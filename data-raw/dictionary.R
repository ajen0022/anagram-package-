## code to prepare `dictionary` dataset goes here

# Download the text file
download.file("https://norvig.com/ngrams/count_1w.txt", "count_1w.txt")

# Read the downloaded text file
dictionary <- read.table("count_1w.txt", header = FALSE, stringsAsFactors = FALSE, col.names = c("Word", "Frequency"))


# Include the data in your package using use_data()
usethis::use_data(dictionary, overwrite = TRUE)



