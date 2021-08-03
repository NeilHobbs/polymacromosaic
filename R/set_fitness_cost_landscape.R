set_fitness_cost_landscape = function(min.fitness.cost,
                                         max.fitness.cost,
                                         number.of.tiles.width,
                                         number.of.tiles.length){
  
  fitness.cost.values = runif(n=number.of.tiles.width*number.of.tiles.length,
                                 min = min.fitness.cost,
                                 max = max.fitness.cost)
  
  fitness.cost.matrix =  matrix(nrow = number.of.tiles.width,
                                   ncol = number.of.tiles.length,
                                   data = fitness.cost.values) 
  
  
  return(fitness.cost.matrix)
  
}
