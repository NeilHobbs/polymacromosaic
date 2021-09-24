
designate_mega_mosaic_deployments = function(landscape.matrix,
                                             mega.mosaic,
                                             number.of.insecticides,
                                             number.of.districts,
                                             number.of.tiles.width,
                                             number.of.tiles.length){
  
  
  #assign district to insecticide:
  districts = LETTERS[1:number.of.districts]
  insecticides.available = rep(seq(1, number.of.insecticides, by = 1), 26)#extend the vector so longer than the number of districts
  insecticides.deployed = insecticides.available[1:number.of.districts]

deployment.mosaic = matrix(data = NA, 
                           nrow = number.of.tiles.length,
                           ncol=number.of.tiles.width)

for(x in 1:number.of.tiles.width){
  for(y in 1:number.of.tiles.length){
    for(i in 1:number.of.districts){
if(mega.mosaic[y, x] == districts[i]){deployment.mosaic[y,x] = insecticides.deployed[i]}
    }
  }
}

#if refugia, set insecticide to 0. 
for(x in 1:number.of.tiles.width){
  for(y in 1:number.of.tiles.length){
    
    deployment.mosaic[y, x] = ifelse(landscape.matrix[y,x] == "refugia",
                                        yes = 0,
                                        no = deployment.mosaic[y, x])
    
    
  }
}

return(deployment.mosaic)
}

# A = make_mega_mosaic(number.of.districts = 4,
#                      number.of.tiles.width = 16,
#                      number.of.tiles.length = 16)
# 
# landscape.matrix1 = make_landscape_matrix(intervention.coverage = 0.8,
#                                          number.of.tiles.width = 16,
#                                          number.of.tiles.length = 16)
# 
# designate_mega_mosaic_deployments(landscape.matrix = landscape.matrix1,
#                                   mega.mosaic = A,
#                                   number.of.insecticides = 3,
#                                   number.of.districts = 4,
#                                   number.of.tiles.width = 16,
#                                   number.of.tiles.length = 16)
