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
    for(y in 1:number.of.tiles.length){
      for(x in 1:number.of.tiles.width){
        resistance = simulation.array[y, x, insecticide, , "migration"]
        ycoord = y
        xcoord= x
        generation = seq(1, maximum.generations, by = 1)
        insecticide.tracked = insecticide
        insecticide.deployed = rep(Deployed[y, x], maximum.generations)
        df = data.frame(resistance, ycoord, xcoord, generation, insecticide.tracked, insecticide.deployed)

        temp.list.x[[x]] = df
      }
      temp.list.y[[y]] = do.call(rbind, temp.list.x)
    }

    temp.list.insecticide[[insecticide]] = do.call(rbind, temp.list.y)
  }

  final_df = do.call(rbind, temp.list.insecticide)

  return(final_df)
}
