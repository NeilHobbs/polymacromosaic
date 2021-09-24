set_male_exposure_landscape = function(min.male.exposure,
                                      max.male.exposure,
                                      number.of.tiles.width,
                                      number.of.tiles.length){
  
  male.exposure.values = runif(n=number.of.tiles.width*number.of.tiles.length,
                              min = min.male.exposure,
                              max = max.male.exposure)
  
  male.exposure.matrix =  matrix(nrow = number.of.tiles.length,
                                ncol = number.of.tiles.width,
                                data = male.exposure.values) 
  
  
  return(male.exposure.matrix)
  
}
