test_that("all set to 1", {
  expect_equal(sum(set_heritability_landscape(min.heritability = 1,
                                              max.heritability = 1,
                                              number.of.tiles.width = 5,
                                              number.of.tiles.length = 5)), 25)
})

test_that("all set to 0", {
  expect_equal(sum(set_heritability_landscape(min.heritability = 0,
                                              max.heritability = 0,
                                              number.of.tiles.width = 5,
                                              number.of.tiles.length = 5)), 0)
})


test_that("all set to 0.5", {
  expect_equal(sum(set_heritability_landscape(min.heritability = 0.5,
                                              max.heritability = 0.5,
                                              number.of.tiles.width = 5,
                                              number.of.tiles.length = 5)), 12.5)
})
