#' Test if a set of words are anagrams of each other
#'
#' This function determines whether a set of words are anagrams of each other. Anagrams are words that contain the same letters but may be arranged differently. The function takes a character vector of words as input and checks if they all share the same set of letters, indicating that they are anagrams.
#'
#' @param words A character vector containing the words to be tested.
#' @param subsets Logical indicating whether to check for anagrams only within subsets of words. Default is FALSE.
#' @return TRUE if the words are all anagrams of each other, FALSE otherwise.
#' @examples
#' # Example 1: checking if multiple words are anagrams
#' words <- c("actors", "costar", "castor")
#' are_anagrams(words)
#'
#' # Example 2: Checking for anagrams within subsets
#' words <- c("alert", "alter", "hello", "world")
#' are_anagrams(words, subsets = TRUE)
#'
#' @export

are_anagrams <- function(words, subsets = FALSE) {
  # Check if input is a character vector
  if (!is.character(words)) {
    stop("Input 'words' must be a character vector.", call. = FALSE)
  }

  # Check if input is not empty
  if (length(words) == 0) {
    stop("Input 'words' cannot be empty.", call. = FALSE)
  }

  # Convert words to lowercase and remove non-alphabetic characters
  words <- gsub("[^a-zA-Z]", "", tolower(words))

  # Define a function to count characters in each word
  check_anagrams <- function(word1, word2) {
    char_count <- integer(26)
    for (char in strsplit(word1, "")[[1]]) {
      char_count[match(char, letters)] <- char_count[match(char, letters)] + 1
    }
    identical(char_count, sort(table(strsplit(word2, "")[[1]])))
  }

  # Check for anagrams within subsets if specified
  if (subsets) {
    all_anagrams <- FALSE
    for (i in 1:length(words)) {
      for (j in i:length(words)) {
        if (i != j) {
          all_anagrams <- all_anagrams || check_anagrams(words[i], words[j])
        }
      }
    }
    return(all_anagrams)
  } else {
    # Check if all words in the list are anagrams of each other
    all_anagrams <- sapply(words[-1], function(word) identical(sort(table(strsplit(words[1], "")[[1]])), sort(table(strsplit(word, "")[[1]]))))
    return(all(all_anagrams))
  }
}
