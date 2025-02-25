# Load testthat package
library(testthat)
library(anagram)

# Define test cases

test_that("Anagram Checker Tests", {

  # Test case 1: Three words that are anagrams of each other
  words1 <- c("alert", "alter", "later")
  expected_outcome1 <- TRUE
  actual_outcome1 <- are_anagrams(words1)
  expect_equal(actual_outcome1, expected_outcome1,
               info = "All words in 'words1' should be anagrams of each other.")

  # Test case 2: Three words that are not anagrams of each other
  words2 <- c("hello", "world", "hi")
  expected_outcome2 <- FALSE
  actual_outcome2 <- are_anagrams(words2)
  expect_equal(actual_outcome2, expected_outcome2,
               info = "Not all words in 'words2' should be anagrams of each other.")

  # Test case 3: Error handling for non-character input
  expect_error(are_anagrams(123),
               info = "An error should be thrown when non-character input is provided.")

  # Test case 4: Error handling for empty input
  expect_error(are_anagrams(character(0)),
               info = "An error should be thrown when empty input is provided.")

})


