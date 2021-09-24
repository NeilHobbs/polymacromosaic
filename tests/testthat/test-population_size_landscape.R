test_that("multiplication works", {
  expect_equal(c(population_size_landscape(number.of.tiles.width = 1,
                                         number.of.tiles.length = 1,
                                         population.size = 40)), 40)
})
