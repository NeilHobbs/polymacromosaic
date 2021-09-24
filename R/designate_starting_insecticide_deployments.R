#Define initial deployed insecticides:
designate_starting_insecticide_deployments = function(landscape.matrix,
                                                      number.of.insecticides,
                                                      number.of.tiles.width,
                                                      number.of.tiles.length){

  insecticide.armoury = seq(1, number.of.insecticides, by = 1)

  deployment.landscape =  matrix(nrow = number.of.tiles.length,
                                 ncol = number.of.tiles.width)

  for(x in 1:number.of.tiles.width){
    for(y in 1:number.of.tiles.length){

      deployment.landscape[y, x] = ifelse(landscape.matrix[y, x] == "refugia",
                                          yes = 0,
                                          no = sample(insecticide.armoury, 1, replace = TRUE))


    }
  }

  return(deployment.landscape)

}

# A = make_landscape_matrix(intervention.coverage = 0.9,
#                       number.of.tiles.width = 10,
#                       number.of.tiles.length = 10)
#
# B = designate_starting_insecticide_deployments(landscape.matrix = A,
#                                                number.of.insecticides = 3,
#                                                number.of.tiles.width = 10,
#                                                number.of.tiles.length = 10)
#
#
# plot(A)
# plot(B)
