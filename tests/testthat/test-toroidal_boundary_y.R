test_that("goes to 1" ,{
  expect_equal(toroidal_boundary_y(y.coord = 11,
                                   number.of.tiles.length = 10), 1)
})

test_that("unchanged", {
  expect_equal(toroidal_boundary_y(y.coord = 4,
                                   number.of.tiles.length = 10), 4)
})

test_that("goes to max value", {
  expect_equal(toroidal_boundary_y(y.coord = 0,
                                   number.of.tiles.length = 10), 10)
})
