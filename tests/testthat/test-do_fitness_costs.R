sim.array = create_starting_array_mosaic(n.insecticides = 1,
                                         maximum.generations = 2,
                                         number.of.tiles.length = 1,
                                         number.of.tiles.width = 1)
sim.array[1, 1, 1, 1, "migration"] = 0


test_that("does not fall below 0", {
  expect_equal(do_fitness_costs(sim.array = sim.array,
                                xcoord = 1,
                                ycoord = 1,
                                insecticide = 1,
                                generation = 2,
                                male.exposure.landscape = matrix(data = 1, nrow=1,ncol = 1),
                                female.exposure.landscape = matrix(data = 1, nrow=1,ncol = 1),
                                heritability.landscape = matrix(data = 1, nrow=1,ncol = 1),
                                exposure.scaling.factor = 1,
                                fitness.cost.landscape = matrix(data=1, ncol=1, nrow = 1)), 0)
})

sim.array[1, 1, 1, 1, "migration"] = 10

test_that("declines by correct amount", {
  expect_equal(do_fitness_costs(sim.array = sim.array,
                                xcoord = 1,
                                ycoord = 1,
                                insecticide = 1,
                                generation = 2,
                                male.exposure.landscape = matrix(data = 1, nrow=1,ncol = 1),
                                female.exposure.landscape = matrix(data = 1, nrow=1,ncol = 1),
                                heritability.landscape = matrix(data = 1, nrow=1,ncol = 1),
                                exposure.scaling.factor = 1,
                                fitness.cost.landscape = matrix(data=1, ncol=1, nrow = 1)), 9)
})
