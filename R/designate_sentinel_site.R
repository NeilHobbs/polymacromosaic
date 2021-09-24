#'@title Designate a single intervention site to be the sentinel site
#'
#'@description It is not realistic that all locations in a landscape will be continually monitored, instead there is likely to be a single
#'location that acts as a sentinel site for the rest of the surrounding localities. The deployment decisions are therefore made on the 
#'the information gathered from the sentinel site. 
#'
#'@param number.of.tiles.width = the number of tiles in the x coordinate direction
#'@param number.of.tiles.length = the number of tiles in the y coordinate direction
#'@param landscape.matrix = the matrix containing whether localities are intervention sites or refugia

designate_sentinel_site = function(number.of.tiles.width,
                                   number.of.tiles.length,
                                   landscape.matrix){
  
  
  x.coords = seq(1, number.of.tiles.width, by = 1)
  y.coords = seq(1, number.of.tiles.length, by = 1)  
  
  sample.x = sample(x.coords, 1, replace = TRUE) 
  sample.y = sample(y.coords, 1, replace = TRUE) 
  
  sentinel.site =  landscape.matrix[sample.y, sample.x]
  
  #Sentinel site must be an intervention site. Continue resampling until it is.
  while(sentinel.site == "refugia"){
    x.coords = seq(1, number.of.tiles.width, by = 1)
    y.coords = seq(1, number.of.tiles.length, by = 1)  
    
    sample.x = sample(x.coords, 1, replace = TRUE) 
    sample.y = sample(y.coords, 1, replace = TRUE) 
    
    sentinel.site =  landscape.matrix[sample.y, sample.x]
    
  }
  
  return(c(sample.y, sample.x))
  
}