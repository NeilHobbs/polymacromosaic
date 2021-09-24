do_insecticide_selection_fitness = function(sim.array,
                                            xcoord,
                                            ycoord,
                                            insecticide,
                                            generation,
                                            male.exposure.landscape,
                                            female.exposure.landscape,
                                            heritability.landscape,
                                            exposure.scaling.factor,
                                            fitness.cost.landscape){
  
  
  update.after.selection = sim.array[ycoord, xcoord, insecticide, generation-1, "migration"] + do_breeders_equation(male.exposure = male.exposure.landscape[ycoord, xcoord],
                                                                                                                    female.exposure = female.exposure.landscape[ycoord, xcoord],
                                                                                                                    heritability = heritability.landscape[ycoord, xcoord],
                                                                                                                    exposure.scaling.factor = exposure.scaling.factor) - (fitness.cost.landscape[ycoord, xcoord] *do_breeders_equation(male.exposure = male.exposure.landscape[ycoord, xcoord],
                                                                                                                                                                                                                                       female.exposure = female.exposure.landscape[ycoord, xcoord],
                                                                                                                                                                                                                                       heritability = heritability.landscape[ycoord, xcoord],
                                                                                                                                                                                                                                       exposure.scaling.factor = exposure.scaling.factor))
  
  update.after.selection = ifelse(update.after.selection < 0,
                                  yes = 0,
                                  no = update.after.selection)
  
  update.after.selection = ifelse(is.na(update.after.selection),
                                  yes = 0,
                                  no = update.after.selection)
  
  return(update.after.selection)
  
}
