#' Anagram Finder with Frequency Information
#'
#' This function creates an S3 object containing a list of words found in a dictionary with a specific subset of letters, along with their relative frequency. The output can be printed and plotted to visualize the relative frequencies of output words. A dictionary with frequency information is present for this extension.
#'
#' @param word The input word.
#' @param dictionary A data frame containing the dictionary of words.
#' @return An S3 object of class 'anagram_output'.
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 geom_bar
#' @importFrom ggplot2 labs
#'
#' @examples
#' # Search for anagrams of the word "listen" in the dictionary
#' output <- anagramfinder_function("listen",dictionary)
#' # Print the output
#' print(output)
#' # Plot the output
#' plot(output)
#' @export
anagramfinder_function <- function(word, dictionary) {
  # Function to sort the characters in a word
  sort_chars <- function(word) {
    sorted_word <- strsplit(tolower(word), "")[[1]]
    sorted_word <- sort(sorted_word)
    return(paste(sorted_word, collapse = ""))
  }

  word <- gsub("[^a-zA-Z]", "", word)  # Clean the input word

  # Sort the characters of the input word
  sorted_input_word <- sort_chars(word)

  # Find words in the dictionary that are anagrams of the input word
  anagrams <- dictionary[dictionary$Word != "", ]
  anagrams$Sorted_Word <- sapply(tolower(anagrams$Word), sort_chars)
  matches <- anagrams[anagrams$Sorted_Word == sorted_input_word, ]

  # Create S3 object
  output <- structure(list(input_word = word, matches = matches),
                      class = "anagram_output")
  return(output)
}


#' @export
print.anagram_output <- function(x, ...) {
  cat("Input word:", x$input_word, "\n")
  cat("Matches found:", nrow(x$matches), "\n")
  print(x$matches[, c("Word", "Frequency")])
}

#' @export
plot.anagram_output <- function(x, ...) {
  ggplot(data = x$matches, aes(x = x$matches$Word, y = x$matches$Frequency, fill = x$matches$Frequency)) +
    geom_bar(stat = "identity", fill = "steelblue") +
    labs(title = "Relative Frequency of Anagram Matches", x = "Word", y = "Frequency")
}

#' Find the most common word among the anagrams
#'
#' This function extracts the most common word from the matches found among the anagrams of the input word. An anagram is a word that can be formed by rearranging the letters of the input word.
#'
#' @param x An S3 object of class 'anagram_output' representing matches found among the anagrams of the input word.
#' @param ... Additional arguments to be passed to methods.
#' @return The most common word found among the anagrams.
#' @examples
#' # Generate matches among the words containing a subset of letters from the input word "when"
#' output <- anagramfinder_function("when", dictionary)
#' most_common_word(output)
#' @export
#' @rdname most_common_word
#' @description
#' The `most_common_word` function extracts the most common word from the matches found among the anagrams.
#' If a specific method is not defined for the class of the input object, a default method is called, which raises an error.
most_common_word <- function(x, ...) {
  UseMethod("most_common_word")
}

#' @rdname most_common_word
#' @export
#' @description
#' Method for extracting the most common word from an S3 object of class 'anagram_output'.
most_common_word.anagram_output <- function(x, ...) {
  most_common <- x$matches[which.max(x$matches$Frequency), "Word"]
  return(most_common)
}

#' @rdname most_common_word
#' @export
#' @description
#' Default method for `most_common_word` function. Raises an error when no specific method is defined for the class of the input object.
most_common_word.default <- function(x, ...) {
  stop("No method defined for object of class '", class(x), "'")
}
