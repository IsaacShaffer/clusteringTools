test_that("output cluster vec is correct size", {
  expect_equal(length(SPECC_RK(RADIAL_KERNEL(DIST(iris[,1:4])), 3)$cluster),
               nrow(iris))
})
