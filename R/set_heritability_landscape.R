set_heritability_landscape = function(min.heritability,
                                     max.heritability,
                                     number.of.tiles.width,
                                     number.of.tiles.length){
  
  heritability.values = runif(n=number.of.tiles.width*number.of.tiles.length,
                              min = min.heritability,
                              max = max.heritability)
  
  heritability.matrix =  matrix(nrow = number.of.tiles.length,
                                ncol = number.of.tiles.width,
                                data = heritability.values) 
  
  
  return(heritability.matrix)
  
}
