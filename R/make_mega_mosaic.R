##Make a Mega-Macro-Mosaic
#'@title Make the district level mega mosaic

#'@description Allows for the creation of spatially insecticide deployments. Such that each
#'location in a district would have the same insecticide deployed. 

make_mega_mosaic = function(number.districts, #must be 1, 2, 4, 9, 16
                            number.of.tiles.width,
                            number.of.tiles.length){
  empty.list = list()
  
  if(number.districts == 1){mega.matrix = matrix(data = LETTERS[1],
                                                 nrow = number.of.tiles.length,
                                                 ncol = number.of.tiles.width)
  
  return(mega.matrix)}
  
  if(number.districts == 2){for(i in 1:2){empty.list[[i]] = matrix(data = LETTERS[i],
                                                                   nrow = number.of.tiles.length/2,
                                                                   ncol = number.of.tiles.width)
  
  
  }
    
    mega.matrix = rbind(empty.list[[1]], empty.list[[2]])
    
    return(mega.matrix)
  }
  
  if(number.districts == 4){
    
    empty.list = list()
    for(i in 1:number.districts){
      
      district.matrix = matrix(data = LETTERS[i],
                               nrow = number.of.tiles.length/2,
                               ncol = number.of.tiles.width/2)
      
      empty.list[[i]] = district.matrix
      
    }
    
    top = cbind(empty.list[[1]], empty.list[[2]])
    
    bottom = cbind(empty.list[[4]], empty.list[[3]])
    
    mega.matrix = rbind(top, bottom)
    return(mega.matrix)
  }
  
  if(number.districts == 9){
    
    empty.list = list()
    for(i in 1:number.districts){
      
      district.matrix = matrix(data = LETTERS[i],
                               nrow = number.of.tiles.length/(sqrt(number.districts)),
                               ncol = number.of.tiles.width/(sqrt(number.districts)))
      
      empty.list[[i]] = district.matrix
      
    }
    
    
    top = cbind(empty.list[[1]], empty.list[[2]], empty.list[[3]])
    
    middle = cbind(empty.list[[6]], empty.list[[4]], empty.list[[5]])
    
    bottom = cbind(empty.list[[8]], empty.list[[9]], empty.list[[7]])
    
    mega.matrix = rbind(top, middle, bottom)
    
    return(mega.matrix)
  }
  
  if(number.districts == 16){
    
    empty.list = list()
    for(i in 1:number.districts){
      
      district.matrix = matrix(data = LETTERS[i],
                               nrow = number.of.tiles.length/(sqrt(number.districts)),
                               ncol = number.of.tiles.width/(sqrt(number.districts)))
      
      empty.list[[i]] = district.matrix
      
    }
    
    
    top = cbind(empty.list[[1]], empty.list[[2]], empty.list[[3]], empty.list[[4]])
    
    top.middle = cbind(empty.list[[8]], empty.list[[5]], empty.list[[6]], empty.list[[7]])
    
    bottom.middle = cbind(empty.list[[11]], empty.list[[12]], empty.list[[9]], empty.list[[10]])
    
    bottom = cbind(empty.list[[14]], empty.list[[15]], empty.list[[16]], empty.list[[13]])
    
    mega.matrix = rbind(top, top.middle,bottom.middle, bottom)
    
    return(mega.matrix)
  }
  
}




