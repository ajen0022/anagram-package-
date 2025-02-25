#' Dictionary Dataset
#'
#' This dataset contains a list of words and their corresponding frequencies.
#' It serves as a dictionary for various text processing tasks.
#'
#' The dataset is sourced from: \url{https://norvig.com/ngrams/count_1w.txt}
#'
#' @name dictionary
#' @docType data
#' @keywords datasets
#' @usage data(dictionary)
#'
#' @description
#' The dictionary dataset contains a list of words and their corresponding frequencies.
#' Each row represents a word, and the 'Frequency' column indicates how often that word appears in a corpus.
#' This dataset is commonly used for text analysis and natural language processing tasks.
#'
#' @format
#' A data frame with 333333 observations and 2 variables:
#' \describe{
#'   \item{Word}{A character vector representing words.}
#'   \item{Frequency}{A numeric vector representing the frequency of each word.}
#' }
#'
#' @examples
#' data(dictionary)
#' head(dictionary)
#'
#' @source
#' \url{https://norvig.com/ngrams/count_1w.txt}
#'
"dictionary"
