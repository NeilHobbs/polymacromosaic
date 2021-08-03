do_fitness_costs = function(sim.array,
                            xcoord,
                            ycoord,
                            insecticide,
                            generation,
                            male.exposure.landscape,
                            female.exposure.landscape,
                            heritability.landscape,
                            exposure.scaling.factor,
                            fitness.cost.landscape){


  update.after.selection = sim.array[xcoord, ycoord, insecticide, generation-1, "migration"] - (fitness.cost.landscape[xcoord, ycoord] *do_breeders_equation(male.exposure = male.exposure.landscape[xcoord, ycoord],
                                                                                                                                                             female.exposure = female.exposure.landscape[xcoord, ycoord],
                                                                                                                                                             heritability = heritability.landscape[xcoord, ycoord],
                                                                                                                                                             exposure.scaling.factor = exposure.scaling.factor))

  update.after.selection = ifelse(update.after.selection < 0,
                                  yes = 0,
                                  no = update.after.selection)

  return(update.after.selection)

}
