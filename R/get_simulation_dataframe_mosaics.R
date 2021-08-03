get_simulation_dataframe_mosaics = function(number.of.tiles.width,
                                            number.of.tiles.length,
                                            number.of.insecticides,
                                            maximum.generations,
                                            simulation.output){
  temp.list.y = list()
  temp.list.x = list()
  temp.list.insecticide = list()

  simulation.array = simulation.output[[1]]

  Deployed = simulation.output[[2]][[1]]

  for(insecticide in 1:number.of.insecticides){
    for(x in 1:number.of.tiles.width){
      for(y in 1:number.of.tiles.length){
        resistance = simulation.array[x, y, insecticide, , "migration"]
        ycoord = y
        xcoord= x
        generation = seq(1, maximum.generations, by = 1)
        insecticide.tracked = insecticide
        insecticide.deployed = rep(Deployed[x, y], maximum.generations)
        df = data.frame(resistance, ycoord, xcoord, generation, insecticide.tracked, insecticide.deployed)

        temp.list.y[[y]] = df
      }
      temp.list.x[[x]] = do.call(rbind, temp.list.y)
    }

    temp.list.insecticide[[insecticide]] = do.call(rbind, temp.list.x)
  }

  final_df = do.call(rbind, temp.list.insecticide)

  return(final_df)
}
