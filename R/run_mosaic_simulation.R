run_mosaic_simulation = function(number.of.tiles.width,
                                 number.of.tiles.length,
                                 number.of.insecticides,
                                 min.male.exposure,
                                 max.male.exposure,
                                 min.female.exposure,
                                 max.female.exposure,
                                 min.heritability,
                                 max.heritability,
                                 min.dispersal,
                                 max.dispersal,
                                 exposure.scaling.factor,
                                 min.fitness.cost,
                                 max.fitness.cost,
                                 maximum.generations,
                                 intervention.coverage,
                                 population.size,
                                 half.population.bioassay.survival.resistance,
                                 conversion.factor,
                                 intercept
                                 ){

  sim.array = create_starting_array_mosaic(n.insecticides = number.of.insecticides,
                                           maximum.generations = maximum.generations,
                                           number.of.tiles.width = number.of.tiles.width,
                                           number.of.tiles.length = number.of.tiles.length)


  sim.array[ , , , 1, ] = 0

  deployment.landscape = designate_starting_insecticide_deployments(landscape.matrix = make_landscape_matrix(intervention.coverage = intervention.coverage,
                                                                                            number.of.tiles.width = number.of.tiles.width,
                                                                                            number.of.tiles.length = number.of.tiles.length),
                                                   number.of.insecticides = number.of.insecticides,
                                                   number.of.tiles.width = number.of.tiles.width,
                                                   number.of.tiles.length = number.of.tiles.length)




  #set parameter values for each tile
  dispersal.landscape = set_dispersal_landscape(min.dispersal = min.dispersal,
                                                max.dispersal = max.dispersal,
                                                number.of.tiles.width = number.of.tiles.width,
                                                number.of.tiles.length = number.of.tiles.length)

  male.exposure.landscape = set_male_exposure_landscape(min.male.exposure = min.male.exposure,
                                         max.male.exposure = max.male.exposure,
                                         number.of.tiles.width = number.of.tiles.width,
                                         number.of.tiles.length = number.of.tiles.length)

  heritability.landscape = set_heritability_landscape(min.heritability = min.heritability,
                                        max.heritability = max.heritability,
                                        number.of.tiles.width = number.of.tiles.width,
                                        number.of.tiles.length = number.of.tiles.length)


  fitness.cost.landscape = set_fitness_cost_landscape(min.fitness.cost = min.fitness.cost,
                                        max.fitness.cost = max.fitness.cost,
                                        number.of.tiles.width = number.of.tiles.width,
                                        number.of.tiles.length = number.of.tiles.length)

  female.exposure.landscape = set_female_exposure_landscape(min.female.exposure = min.female.exposure,
                                           max.female.exposure = max.female.exposure,
                                           number.of.tiles.width = number.of.tiles.width,
                                           number.of.tiles.length = number.of.tiles.length)

  population.size.landscape = population_size_landscape(number.of.tiles.width = number.of.tiles.width,
                                                        number.of.tiles.length = number.of.tiles.length,
                                                        population.size = population.size)

 landscape.list = list(deployment.landscape,
                       dispersal.landscape,
                       male.exposure.landscape,
                       female.exposure.landscape,
                       heritability.landscape,
                       fitness.cost.landscape)



for(generation in 2:maximum.generations){
#do the selection
  for(insecticide in 1:number.of.insecticides){
    for(x in 1:max(number.of.tiles.width)){
      for(y in 1:max(number.of.tiles.length)){
        if(deployment.landscape[x, y] == insecticide){
          sim.array[x, y, insecticide, generation, "selection"] = do_insecticide_selection_fitness(sim.array = sim.array,
                                                                                                   xcoord = x,
                                                                                                   ycoord = y,
                                                                                                   insecticide = insecticide,
                                                                                                   generation = generation,
                                                                                                   male.exposure.landscape = male.exposure.landscape,
                                                                                                   female.exposure.landscape = female.exposure.landscape,
                                                                                                   heritability.landscape = heritability.landscape,
                                                                                                   exposure.scaling.factor = exposure.scaling.factor,
                                                                                                   fitness.cost.landscape = fitness.cost.landscape)}
        else(sim.array[x, y, insecticide, generation, "selection"] = do_fitness_costs(sim.array = sim.array,
                                                                                      xcoord = x,
                                                                                      ycoord = y,
                                                                                      insecticide = insecticide,
                                                                                      generation = generation,
                                                                                      male.exposure.landscape = male.exposure.landscape,
                                                                                      female.exposure.landscape = female.exposure.landscape,
                                                                                      heritability.landscape = heritability.landscape,
                                                                                      exposure.scaling.factor = exposure.scaling.factor,
                                                                                      fitness.cost.landscape = fitness.cost.landscape))


      }
    }
  }
  #then do dispersal
  for(insecticide in 1:number.of.insecticides){
    for(x in 1:max(number.of.tiles.width)){
      for(y in 1:max(number.of.tiles.length)){

             sim.array[x, y, insecticide, generation, "migration"] = do_mosquito_dispersal(x.coord = x,
                                                                                           y.coord = y,
                                                                                           sim.array = sim.array,
                                                                                           generation = generation,
                                                                                           insecticide = insecticide,
                                                                                           number.of.tiles.width = number.of.tiles.width,
                                                                                           number.of.tiles.length = number.of.tiles.length,
                                                                                           dispersal.landscape = dispersal.landscape,
                                                                                           population.size.landscape = population.size.landscape,
                                                                                           conversion.factor = conversion.factor,
                                                                                           intercept = intercept,
                                                                                           half.population.bioassay.survival.resistance = half.population.bioassay.survival.resistance,
                                                                                           female.exposure.landscape = female.exposure.landscape,
                                                                                           deployment.landscape = deployment.landscape)
      }
    }
  }
}
  return(list(sim.array, landscape.list))
}
