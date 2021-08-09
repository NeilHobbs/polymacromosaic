test_that("all values equal 1", {
  expect_equal(sum(set_dispersal_landscape(min.dispersal = 1,
                                       max.dispersal = 1,
                                       number.of.tiles.length = 5,
                                       number.of.tiles.width = 5)), 25)
})

test_that("all values equal 0", {
  expect_equal(sum(set_dispersal_landscape(min.dispersal = 0,
                                           max.dispersal = 0,
                                           number.of.tiles.length = 5,
                                           number.of.tiles.width = 5)), 0)
})


test_that("all values equal 0.5", {
  expect_equal(sum(set_dispersal_landscape(min.dispersal = 0.5,
                                           max.dispersal = 0.5,
                                           number.of.tiles.length = 5,
                                           number.of.tiles.width = 5)), 12.5)
})