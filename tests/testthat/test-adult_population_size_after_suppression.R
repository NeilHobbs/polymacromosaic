sim.array = create_starting_array_mosaic(n.insecticides = 1,
                                         maximum.generations = 2,
                                         number.of.tiles.length = 1,
                                         number.of.tiles.width = 1)
sim.array[1, 1, 1, 1, "migration"] = 900


test_that("population halves", {
  expect_equal(adult_population_size_after_suppression(population.size.landscape = matrix(data = 1000, nrow=1, ncol = 1),
                                                       deployment.landscape = matrix(data = 1, nrow=1, ncol = 1),
                                                       x.coord = 1,
                                                       y.coord = 1,
                                                       generation = 2,
                                                       sim.array = sim.array,
                                                       conversion.factor = 1,
                                                       intercept = 0,
                                                       half.population.bioassay.survival.resistance = 900,
                                                       female.exposure.landscape = matrix(data = 1, nrow=1, ncol=1))
               , 500)
})

test_that("no exposure no suppression", {
  expect_equal(adult_population_size_after_suppression(population.size.landscape = matrix(data = 1000, nrow=1, ncol = 1),
                                                       deployment.landscape = matrix(data = 1, nrow=1, ncol = 1),
                                                       x.coord = 1,
                                                       y.coord = 1,
                                                       generation = 2,
                                                       sim.array = sim.array,
                                                       conversion.factor = 1,
                                                       intercept = 0,
                                                       half.population.bioassay.survival.resistance = 900,
                                                       female.exposure.landscape = matrix(data = 0, nrow=1, ncol=1))
               , 1000)
})


sim.array[1, 1, 0, 1, "migration"] = 900
test_that("no suppression in refugia", {
  expect_equal(adult_population_size_after_suppression(population.size.landscape = matrix(data = 1000, nrow=1, ncol = 1),
                                                       deployment.landscape = matrix(data = 1, nrow=1, ncol = 1),
                                                       x.coord = 1,
                                                       y.coord = 1,
                                                       generation = 2,
                                                       sim.array = sim.array,
                                                       conversion.factor = 1,
                                                       intercept = 0,
                                                       half.population.bioassay.survival.resistance = 900,
                                                       female.exposure.landscape = matrix(data = 0, nrow=1, ncol=1))
               , 1000)
})