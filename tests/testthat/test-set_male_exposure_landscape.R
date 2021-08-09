test_that("all set to 1", {
  expect_equal(mean(set_male_exposure_landscape(min.male.exposure = 1,
                                                      max.male.exposure = 1,
                                                      number.of.tiles.width = 10,
                                                      number.of.tiles.length = 10)), 1)
})

test_that("all set to 0", {
  expect_equal(mean(set_male_exposure_landscape(min.male.exposure = 0,
                                                max.male.exposure = 0,
                                                number.of.tiles.width = 10,
                                                number.of.tiles.length = 10)), 0)
})


test_that("all set to 0.5", {
  expect_equal(mean(set_male_exposure_landscape(min.male.exposure = 0.5,
                                                max.male.exposure = 0.5,
                                                number.of.tiles.width = 10,
                                                number.of.tiles.length = 10)), 0.5)
})
