test_that("x coordinate returned to 1", {
  expect_equal(toroidal_boundary_x(x.coord = 7,
                                   number.of.tiles.width = 6)
               , 1)
})

test_that("x coordinate unchanged", {
  expect_equal(toroidal_boundary_x(x.coord = 6,
                                   number.of.tiles.width = 6)
               , 6)
})

test_that("x coordinate becomes max", {
  expect_equal(toroidal_boundary_x(x.coord = 0,
                                   number.of.tiles.width = 6)
               , 6)
})
