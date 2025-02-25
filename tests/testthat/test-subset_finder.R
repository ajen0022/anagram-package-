
library(testthat)
library(anagram)
library(ggplot2)
data("dictionary")


# Test case 1: Test for correct plotting
test_that("plotting works as expected", {
  # Call the function
  output <- anagramfinder_function("this", dictionary)

  # Plot the output
  plot_output <- plot(output)

  # Check if plot_output is a ggplot object
  expect_true(inherits(plot_output, "ggplot"))
})



# Test case 2: Test for correct printing
test_that("printing works as expected", {
  # Call the function
  output <- anagramfinder_function("when", dictionary)

  # Capture printed output
  printed_output <- capture_output(print(output))

  # Check if printed output contains expected information
  expect_match(printed_output, "when")  # Check if input word is printed
  expect_match(printed_output, "Matches found: [0-9]+")  # Check if matches count is printed
  expect_match(printed_output, "Word\\s+Frequency")
  expect_match(printed_output, "when\\s+[0-9]+")  # Check if word and frequency are printed
})




# Test case 3: Define a test case for most_common_word function
test_that("most_common_word function extracts the most common word correctly", {
  # Define a sample input anagram_output object
  output <- anagramfinder_function("you", dictionary)

  # Call the most_common_word function
  actual_most_common <- most_common_word(output)

  # Check if the actual most common word is found in the dictionary
  expect_true(actual_most_common %in% dictionary$Word,
              info = "Most common word is found in the dictionary")
})



# Test case 4: Basic functionality test
test_basic <- function() {
  output <- anagramfinder_function("you", dictionary)

  # Print output
  print(output)

  # Plot output
  plot(output)
}

# Test case 5: Edge case - no matches
test_no_matches <- function() {
  output <- anagramfinder_function("where", dictionary)

  # Print output
  print(output)

  # Plot output
  plot(output)
}

# Test case 6: Multiple matches
test_multiple_matches <- function() {
  output <- anagramfinder_function("that", dictionary)

  # Print output
  print(output)

  # Plot output
  plot(output)
}

# Test case 7: Testing most_common_word method
test_most_common_word <- function() {
  output <- anagramfinder_function("you", dictionary)

  # Get most common word
  most_common <- most_common_word(output)
  cat("Most common word:", most_common, "\n")
}

# Run test cases
test_basic()
test_no_matches()
test_multiple_matches()
test_most_common_word()

