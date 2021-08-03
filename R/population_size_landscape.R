population_size_landscape = function(number.of.tiles.width,
                                     number.of.tiles.length,
                                     population.size){

  population.size.landscape =  matrix(nrow = number.of.tiles.width,
                                      ncol = number.of.tiles.length,
                                      data = population.size)

  return(population.size.landscape)

}
