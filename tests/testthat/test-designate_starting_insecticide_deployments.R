A = make_landscape_matrix(intervention.coverage = 1,
                      number.of.tiles.width = 5,
                      number.of.tiles.length = 5)


test_that("deploys all 1", {
  expect_equal(sum(designate_starting_insecticide_deployments(landscape.matrix = A,
                                                          number.of.insecticides = 1,
                                                          number.of.tiles.width = 5,
                                                          number.of.tiles.length = 5)), 25)
})



A = make_landscape_matrix(intervention.coverage = 0,
                          number.of.tiles.width = 5,
                          number.of.tiles.length = 5)
test_that("deploys all 0", {
  expect_equal(sum(designate_starting_insecticide_deployments(landscape.matrix = A,
                                                              number.of.insecticides = 1,
                                                              number.of.tiles.width = 5,
                                                              number.of.tiles.length = 5)), 0)
})