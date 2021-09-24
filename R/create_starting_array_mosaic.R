#Make an array for each tile::
create_starting_array_mosaic = function(n.insecticides, maximum.generations,
                                        number.of.tiles.width, number.of.tiles.length){

  #dimension 1: insecticide to which resistance intensity corresponds
  #dimension 2: generation of mosquito

  simulation.data = array_named(y.coord = 1:number.of.tiles.length,
                                x.coord = 1:number.of.tiles.width,
                                insecticide = 1:n.insecticides,
                                generation = 1:maximum.generations,
                                timepoint = c("selection", "migration")) #this is the insecticide that is currently deployed
}

# temp.array = create_starting_array_mosaic(n.insecticides = 3,
#                              maximum.generations = 1,
#                              number.of.tiles.width = 1,
#                              number.of.tiles.length = 1)

