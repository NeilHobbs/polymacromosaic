sim.array = create_starting_array_mosaic(n.insecticides = 1,
                                         maximum.generations = 10,
                                         number.of.tiles.width = 1,
                                         number.of.tiles.length = 1)
sim.array[1, 1, 1, 1, "migration"] = 0
sim.array[1, 1, 1, 2, "selection"] = 10


dispersal.landscape = set_dispersal_landscape(min.dispersal = 1,
                                              max.dispersal = 1,
                                              number.of.tiles.width = 1,
                                              number.of.tiles.length = 1)


population.size.landscape = population_size_landscape(number.of.tiles.width = 1,
                                                      number.of.tiles.length = 1,
                                                      population.size = 10000)

female.exposure.landscape = set_female_exposure_landscape(min.female.exposure = 1,
                                                          max.female.exposure = 1,
                                                          number.of.tiles.width = 1,
                                                          number.of.tiles.length = 1)

deployment.landscape = matrix(1, nrow = 1, ncol=1)

test_that("single tile no change", {
  
  
  expect_equal(do_mosquito_dispersal(x.coord = 1,
                                     y.coord = 1,
                                     sim.array = sim.array,
                                     generation = 2,
                                     insecticide = 1,
                                     number.of.tiles.width = 1,
                                     number.of.tiles.length = 1,
                                     dispersal.landscape = dispersal.landscape,
                                     population.size.landscape = population.size.landscape,
                                     conversion.factor = 1,
                                     intercept = 1,
                                     half.population.bioassay.survival.resistance = 900,
                                     female.exposure.landscape = female.exposure.landscape,
                                     deployment.landscape = deployment.landscape), 10)
})
