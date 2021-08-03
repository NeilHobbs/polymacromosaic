# deployment.landscape = designate_starting_insecticide_deployments(landscape.matrix = make_landscape_matrix(intervention.coverage = 0.7,
#                                                                                                            number.of.tiles.width = 5,
#                                                                                                            number.of.tiles.length = 5),
#                                                                   number.of.insecticides = 3,
#                                                                   number.of.tiles.width = 5,
#                                                                   number.of.tiles.length = 5)
# deployment.landscape

rotate_insecticides = function(deployment.landscape,
                               number.of.insectides,
                               number.of.tiles.width,
                               number.of.tiles.length){
  for(x in 1:number.of.tiles.width){
    for(y in 1:number.of.tiles.length){

    if(deployment.landscape[x, y] == 0){deployment.landscape[x, y] = 0}
      else(deployment.landscape[x, y] = deployment.landscape[x, y]+1)
    }
  }

  for(x in 1:number.of.tiles.width){
    for(y in 1:number.of.tiles.length){

      if(deployment.landscape[x, y] > number.of.insectides){deployment.landscape[x, y] = 1}
    }
  }

  return(deployment.landscape)
}
#
#
# rotate_insecticides(deployment.landscape = deployment.landscape,
#                     number.of.insectides = 3,
#                     number.of.tiles.width = 5,
#                     number.of.tiles.length = 5)


