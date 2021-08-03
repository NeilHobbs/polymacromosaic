set_dispersal_landscape = function(min.dispersal,
                                   max.dispersal,
                                   number.of.tiles.width,
                                   number.of.tiles.length){
  
  dispersal.values = runif(n=number.of.tiles.width*number.of.tiles.length,
                              min = min.dispersal,
                              max = max.dispersal)
  
  dispersal.matrix =  matrix(nrow = number.of.tiles.width,
                                ncol = number.of.tiles.length,
                                data = dispersal.values) 
  
  
  return(dispersal.matrix)
  
}
