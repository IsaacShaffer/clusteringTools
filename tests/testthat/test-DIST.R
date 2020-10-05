test_that("size and values are correct and positive", {
  ## Test output row count
  expect_equal(nrow(DIST(iris[,1:4])),
               nrow(iris[,1:4]))
  ## Test output col count
  expect_equal(ncol(DIST(iris[,1:4])),
               nrow(iris[,1:4]))
  ## output is Euclidean distances so
  ## test all values positive.
  expect_equal(ncol(DIST(iris[,1:4])),
               nrow(iris[,1:4]))
  expect_true(all(DIST(iris[,1:4]) >= 0))
})
