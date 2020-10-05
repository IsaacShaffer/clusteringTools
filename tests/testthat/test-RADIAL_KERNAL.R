test_that("output dimensions match input dimensions", {
  expect_true(all(dim(RADIAL_KERNEL(DIST(iris[,1:4]))) ==
                  dim(DIST(iris[,1:4]))))
})
