test_that("equation works", {
  expect_equal(do_breeders_equation(male.exposure = 1,
                                    female.exposure = 1,
                                    heritability = 1,
                                    exposure.scaling.factor = 1), 1)
  expect_equal(do_breeders_equation(male.exposure = 0,
                                    female.exposure = 1,
                                    heritability = 1,
                                    exposure.scaling.factor = 1), 0.5)
  expect_equal(do_breeders_equation(male.exposure = 1,
                                    female.exposure = 0,
                                    heritability = 1,
                                    exposure.scaling.factor = 1), 0)
  expect_equal(do_breeders_equation(male.exposure = 1,
                                    female.exposure = 1,
                                    heritability = 0,
                                    exposure.scaling.factor = 1), 0)
  expect_equal(do_breeders_equation(male.exposure = 1,
                                    female.exposure = 1,
                                    heritability = 1,
                                    exposure.scaling.factor = 10), 10)
})
