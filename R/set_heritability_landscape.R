set_heritability_landscape = function(min.heritability,
                                     max.heritability,
                                     number.of.tiles.width,
                                     number.of.tiles.length){
  
  heritability.values = runif(n=number.of.tiles.width*number.of.tiles.length,
                              min = min.heritability,
                              max = max.heritability)
  
  heritability.matrix =  matrix(nrow = number.of.tiles.width,
                                ncol = number.of.tiles.length,
                                data = heritability.values) 
  
  
  return(heritability.matrix)
  
}
