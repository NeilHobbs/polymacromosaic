test_that("all intervention site", {
  expect_equal(c(make_landscape_matrix(intervention.coverage = 1,
                                       number.of.tiles.width = 3,
                                       number.of.tiles.length = 3)), rep("intervention", 9))
})

test_that("all refugia", {
  expect_equal(c(make_landscape_matrix(intervention.coverage = 0,
                                       number.of.tiles.width = 3,
                                       number.of.tiles.length = 3)), rep("refugia", 9))
})
