sim.array = create_starting_array_mosaic(n.insecticides = 1,
                                         maximum.generations = 2,
                                         number.of.tiles.width = 2,
                                         number.of.tiles.length = 2)

sim.array[1, 1, 1, 1, "migration"] = 0
heritability.landscape = set_heritability_landscape(min.heritability = 1,
                                                    max.heritability = 1,
                                                    number.of.tiles.width = 2,
                                                    number.of.tiles.length = 2)

male.exposure.landscape = set_male_exposure_landscape(min.male.exposure = 1,
                                                      max.male.exposure = 1,
                                                      number.of.tiles.width = 2,
                                                      number.of.tiles.length = 2)

female.exposure.landscape = set_female_exposure_landscape(min.female.exposure = 1,
                                                          max.female.exposure = 1,
                                                          number.of.tiles.width = 2,
                                                          number.of.tiles.length = 2)

fitness.cost.landscape = set_fitness_cost_landscape(min.fitness.cost = 0,
                                                    max.fitness.cost = 0,
                                                    number.of.tiles.width = 2,
                                                    number.of.tiles.length = 2)
test_that("equation works", {
  expect_equal(do_insecticide_selection_fitness(sim.array = sim.array,
                                                xcoord = 1,
                                                ycoord = 1,
                                                insecticide = 1,
                                                generation = 2,
                                                male.exposure.landscape = male.exposure.landscape,
                                                female.exposure.landscape = female.exposure.landscape,
                                                heritability.landscape = heritability.landscape,
                                                exposure.scaling.factor = 10,
                                                fitness.cost.landscape = fitness.cost.landscape), 10)
})
