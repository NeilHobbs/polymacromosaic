test_that("all set to 1", {
  expect_equal(sum(set_female_exposure_landscape(min.female.exposure = 1,
                                                        max.female.exposure = 1,
                                                        number.of.tiles.width = 5,
                                                        number.of.tiles.length = 5)), 25)
})

test_that("all set to 0", {
  expect_equal(sum(set_female_exposure_landscape(min.female.exposure = 0,
                                                 max.female.exposure = 0,
                                                 number.of.tiles.width = 5,
                                                 number.of.tiles.length = 5)), 0)
})

test_that("all set to 0.5", {
  expect_equal(sum(set_female_exposure_landscape(min.female.exposure = 0.5,
                                                 max.female.exposure = 0.5,
                                                 number.of.tiles.width = 5,
                                                 number.of.tiles.length = 5)), 12.5)
})