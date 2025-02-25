# Load testthat package
library(testthat)
library(anagram)


# Define test case
test_that("Anagram Checker Tests", {

  # Test if more than two words have anagram subsets of minimal length
  expect_true(anagramsubset_function(c("tiger", "right", "tight"),3),
              info = "The words 'tiger' and 'right' should have anagram subsets of minimal length 3.")

})

