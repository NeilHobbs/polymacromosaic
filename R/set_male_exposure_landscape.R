set_male_exposure_landscape = function(min.male.exposure,
                                      max.male.exposure,
                                      number.of.tiles.width,
                                      number.of.tiles.length){
  
  male.exposure.values = runif(n=number.of.tiles.width*number.of.tiles.length,
                              min = min.male.exposure,
                              max = max.male.exposure)
  
  male.exposure.matrix =  matrix(nrow = number.of.tiles.width,
                                ncol = number.of.tiles.length,
                                data = male.exposure.values) 
  
  
  return(male.exposure.matrix)
  
}
