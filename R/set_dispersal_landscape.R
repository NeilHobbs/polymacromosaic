set_dispersal_landscape = function(min.dispersal,
                                   max.dispersal,
                                   number.of.tiles.width,
                                   number.of.tiles.length){
  
  dispersal.values = runif(n=number.of.tiles.width*number.of.tiles.length,
                              min = min.dispersal,
                              max = max.dispersal)
  
  dispersal.matrix =  matrix(nrow = number.of.tiles.length,
                                ncol = number.of.tiles.width,
                                data = dispersal.values) 
  
  
  return(dispersal.matrix)
  
}
