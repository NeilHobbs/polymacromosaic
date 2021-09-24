set_female_exposure_landscape = function(min.female.exposure,
                                       max.female.exposure,
                                       number.of.tiles.width,
                                       number.of.tiles.length){
  
  female.exposure.values = runif(n=number.of.tiles.width*number.of.tiles.length,
                               min = min.female.exposure,
                               max = max.female.exposure)
  
  female.exposure.matrix =  matrix(nrow = number.of.tiles.length,
                                 ncol = number.of.tiles.width,
                                 data = female.exposure.values) 
  
  
  return(female.exposure.matrix)
  
}
