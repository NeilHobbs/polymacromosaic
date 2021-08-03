adult_population_size_after_suppression = function(population.size.landscape,
                                                   deployment.landscape,
                                                   x.coord,
                                                   y.coord,
                                                   generation,
                                                   sim.array,
                                                   conversion.factor,
                                                   intercept,
                                                   half.population.bioassay.survival.resistance,
                                                   female.exposure.landscape){

  #which insecticide:
  deployed = deployment.landscape[x.coord, y.coord]
if(deployed != 0){
  resistance = sim.array[x.coord, y.coord, deployed, generation-1, "migration"] #resistance from previous generation

  survival = convert_bioassay_survival_to_field(bioassay.survival = resistance_to_bioassay_survival(maximum.bioassay.survival.proportion = 1,
                                                                                                    mean.population.resistance = resistance,
                                                                                                    michaelis.menten.slope = 1,
                                                                                                    half.population.bioassay.survival.resistance = half.population.bioassay.survival.resistance,
                                                                                                    sd.population.resistance = 0, #measured without error
                                                                                                    nsim = 1),
                                                conversion.factor = conversion.factor,
                                                intercept = intercept)

  female.exposure = female.exposure.landscape[x.coord, y.coord]

  population.size = population.size.landscape[x.coord, y.coord]

  final.population.size = (population.size*female.exposure*survival) + ((1-female.exposure)*population.size)
}
  if(deployed == 0){final.population.size = population.size = population.size.landscape[x.coord, y.coord]}

  return(final.population.size)
}

