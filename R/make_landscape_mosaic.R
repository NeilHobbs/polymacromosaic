#polyresland

#Make Landscape Matrix.

make_landscape_matrix = function(intervention.coverage,
                                 number.of.tiles.width,
                                 number.of.tiles.length){

  number.of.tiles = number.of.tiles.width*number.of.tiles.length

  frequency.intervention = as.integer(intervention.coverage * number.of.tiles)
  frequency.refugia = as.integer(((1- intervention.coverage) * number.of.tiles))

  vector.to.sample = c(rep("intervention", times = frequency.intervention), rep("refugia", times = frequency.refugia))

  landscape.matrix = matrix(nrow = number.of.tiles.width,
                            ncol = number.of.tiles.length,
                            data = sample(vector.to.sample, number.of.tiles, replace = TRUE))

  return(landscape.matrix)

}
#
# make_landscape_matrix(intervention.coverage = 0.99,
#                       number.of.tiles.width = 5,
#                       number.of.tiles.length = 5)
#
#
# library(plot.matrix)
#
# plot(make_landscape_matrix(intervention.coverage = 0.99,
#                            number.of.tiles.width = 50,
#                            number.of.tiles.length = 50))

