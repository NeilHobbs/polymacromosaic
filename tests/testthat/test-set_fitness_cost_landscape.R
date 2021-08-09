test_that("all set to 1", {
  expect_equal(sum(set_fitness_cost_landscape(min.fitness.cost = 1,
                                                     max.fitness.cost = 1,
                                                     number.of.tiles.width = 5,
                                                     number.of.tiles.length = 5)), 25)
})

test_that("all set to 0", {
  expect_equal(sum(set_fitness_cost_landscape(min.fitness.cost = 0,
                                          max.fitness.cost = 0,
                                          number.of.tiles.width = 5,
                                          number.of.tiles.length = 5)), 0)
})

test_that("all set to 0.5", {
  expect_equal(sum(set_fitness_cost_landscape(min.fitness.cost =0.5,
                                          max.fitness.cost = 0.5,
                                          number.of.tiles.width = 5,
                                          number.of.tiles.length = 5)), 12.5)
})