#' Check anagram subset with minimum character length
#'
#' This function checks whether a subset of words contains anagrams of each other,considering combinations of characters of a specified minimum length.
#'
#'
#' @param words A character vector containing the words to be checked.
#' @param min_length An integer specifying the minimum length of combinations of characters to consider. Default is 1.
#' @return TRUE if the subset contains anagrams of each other, FALSE otherwise.
#' @examples
#' # Example 1: Subset contains anagrams
#'  anagramsubset_function(c("tiger", "right", "tight"), 4)
#'
#' # Example 2: Subset doesn't contain anagrams
#' anagramsubset_function(c("hello", "world", "hi"), 3)
#'
#'
#' @export
anagramsubset_function <- function(words, min_length = 1) {
  # Function to count characters in a word
  count_chars <- function(word) {
    char_count <- integer(26)
    for (char in strsplit(word, "")[[1]]) {
      char_count[match(char, letters)] <- char_count[match(char, letters)] + 1
    }
    return(char_count)
  }

  # Function to check if two words are anagrams
  are_anagrams <- function(word1, word2) {
    return(identical(sort(count_chars(word1)), sort(count_chars(word2))))
  }

  # Function to generate all combinations of a certain length of characters in a word
  generate_combinations <- function(word, length) {
    n <- nchar(word)
    combinations <- character(n - length + 1)
    for (i in 1:(n - length + 1)) {
      combinations[i] <- substr(word, i, i + length - 1)
    }
    return(combinations)
  }

  # Convert words to lowercase and remove spaces
  words <- gsub(" ", "", tolower(words))

  # Check if all words in the list are anagrams of each other
  for (i in 1:(length(words) - 1)) {
    for (j in (i + 1):length(words)) {
      # Generate combinations of characters of minimal length for both words
      word1_combinations <- generate_combinations(words[i], min_length)
      word2_combinations <- generate_combinations(words[j], min_length)

      # Check if any combination in word1 is an anagram of any combination in word2
      if (!any(sapply(word1_combinations, function(comb1) any(sapply(word2_combinations, function(comb2) are_anagrams(comb1, comb2)))))) {
        return(FALSE)
      }
    }
  }

  return(TRUE)
}
