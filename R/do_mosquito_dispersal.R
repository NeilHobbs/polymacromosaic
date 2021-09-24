#Assume mosquitoes only disperse 1 tile in any direction:

do_mosquito_dispersal = function(x.coord,
                                 y.coord,
                                 sim.array,
                                 generation,
                                 insecticide,
                                 number.of.tiles.width,
                                 number.of.tiles.length,
                                 dispersal.landscape,
                                 population.size.landscape,
                                 conversion.factor,
                                 intercept,
                                 half.population.bioassay.survival.resistance,
                                 female.exposure.landscape,
                                 deployment.landscape
                                 ){
  #resistance of those staying
home.tile = (sim.array[y.coord, x.coord, insecticide, generation, "selection"])

#resistance of 8 neighbouring tiles:::
tile.1 =  (sim.array[toroidal_boundary_y(y.coord = y.coord-1,
                                         number.of.tiles.length = number.of.tiles.length),
                     toroidal_boundary_x(x.coord = x.coord - 1,
                                         number.of.tiles.width = number.of.tiles.width), insecticide, generation, "selection"])




tile.2 =  (sim.array[toroidal_boundary_y(y.coord = y.coord-1,
                                         number.of.tiles.length = number.of.tiles.length),
                     toroidal_boundary_x(x.coord = x.coord,
                                         number.of.tiles.width = number.of.tiles.width), insecticide, generation, "selection"])



tile.3 =  (sim.array[toroidal_boundary_y(y.coord = y.coord-1,
                                         number.of.tiles.length = number.of.tiles.length),
                     toroidal_boundary_x(x.coord = x.coord+1,
                                         number.of.tiles.width = number.of.tiles.width), insecticide, generation, "selection"])



tile.4 =  (sim.array[toroidal_boundary_y(y.coord = y.coord,
                                         number.of.tiles.length = number.of.tiles.length),
                     toroidal_boundary_x(x.coord = x.coord-1,
                                         number.of.tiles.width = number.of.tiles.width), insecticide, generation, "selection"])



tile.5 =  (sim.array[toroidal_boundary_y(y.coord = y.coord,
                                         number.of.tiles.length = number.of.tiles.length),
                     toroidal_boundary_x(x.coord = x.coord+1,
                                         number.of.tiles.width = number.of.tiles.width), insecticide, generation, "selection"])


tile.6 =  (sim.array[toroidal_boundary_y(y.coord = y.coord+1,
                                         number.of.tiles.length = number.of.tiles.length),
                     toroidal_boundary_x(x.coord = x.coord-1,
                                         number.of.tiles.width = number.of.tiles.width), insecticide, generation, "selection"])


tile.7 =  (sim.array[toroidal_boundary_y(y.coord = y.coord+1,
                                         number.of.tiles.length = number.of.tiles.length),
                     toroidal_boundary_x(x.coord = x.coord,
                                         number.of.tiles.width = number.of.tiles.width), insecticide, generation, "selection"])


tile.8 =  (sim.array[toroidal_boundary_y(y.coord = y.coord+1,
                                         number.of.tiles.length = number.of.tiles.length),
                     toroidal_boundary_x(x.coord = x.coord+1,
                                         number.of.tiles.width = number.of.tiles.width), insecticide, generation, "selection"])



#Calculating corresponding population sizes
home.tile.pop = adult_population_size_after_suppression(population.size.landscape = population.size.landscape,
                                                        deployment.landscape = deployment.landscape,
                                                        x.coord = x.coord,
                                                        y.coord = y.coord,
                                                        generation = generation,
                                                        sim.array = sim.array,
                                                        conversion.factor = conversion.factor,
                                                        intercept = intercept,
                                                        half.population.bioassay.survival.resistance = half.population.bioassay.survival.resistance,
                                                        female.exposure.landscape = female.exposure.landscape)

tile.1.pop = adult_population_size_after_suppression(population.size.landscape = population.size.landscape,
                                                     deployment.landscape = deployment.landscape,
                                                     x.coord = toroidal_boundary_x(x.coord = x.coord-1,
                                                                                   number.of.tiles.width = number.of.tiles.width),
                                                     y.coord = toroidal_boundary_y(y.coord = y.coord - 1,
                                                                                   number.of.tiles.length = number.of.tiles.length),
                                                     generation = generation,
                                                     sim.array = sim.array,
                                                     conversion.factor = conversion.factor,
                                                     intercept = intercept,
                                                     half.population.bioassay.survival.resistance = half.population.bioassay.survival.resistance,
                                                     female.exposure.landscape = female.exposure.landscape)

tile.2.pop = adult_population_size_after_suppression(population.size.landscape = population.size.landscape,
                                                     deployment.landscape = deployment.landscape,
                                                     x.coord = toroidal_boundary_x(x.coord = x.coord-1,
                                                                                   number.of.tiles.width = number.of.tiles.width),
                                                     y.coord = toroidal_boundary_y(y.coord = y.coord,
                                                                                   number.of.tiles.length = number.of.tiles.length),
                                                     generation = generation,
                                                     sim.array = sim.array,
                                                     conversion.factor = conversion.factor,
                                                     intercept = intercept,
                                                     half.population.bioassay.survival.resistance = half.population.bioassay.survival.resistance,
                                                     female.exposure.landscape = female.exposure.landscape)

tile.3.pop = adult_population_size_after_suppression(population.size.landscape = population.size.landscape,
                                                     deployment.landscape = deployment.landscape,
                                                     x.coord = toroidal_boundary_x(x.coord = x.coord-1,
                                                                                   number.of.tiles.width = number.of.tiles.width),
                                                     y.coord = toroidal_boundary_y(y.coord = y.coord+1,
                                                                                   number.of.tiles.length = number.of.tiles.length),
                                                     generation = generation,
                                                     sim.array = sim.array,
                                                     conversion.factor = conversion.factor,
                                                     intercept = intercept,
                                                     half.population.bioassay.survival.resistance = half.population.bioassay.survival.resistance,
                                                     female.exposure.landscape = female.exposure.landscape)

tile.4.pop = adult_population_size_after_suppression(population.size.landscape = population.size.landscape,
                                                     deployment.landscape = deployment.landscape,
                                                     x.coord = toroidal_boundary_x(x.coord = x.coord,
                                                                                   number.of.tiles.width = number.of.tiles.width),
                                                     y.coord = toroidal_boundary_y(y.coord = y.coord-1,
                                                                                   number.of.tiles.length = number.of.tiles.length),
                                                     generation = generation,
                                                     sim.array = sim.array,
                                                     conversion.factor = conversion.factor,
                                                     intercept = intercept,
                                                     half.population.bioassay.survival.resistance = half.population.bioassay.survival.resistance,
                                                     female.exposure.landscape = female.exposure.landscape)

tile.5.pop = adult_population_size_after_suppression(population.size.landscape = population.size.landscape,
                                                     deployment.landscape = deployment.landscape,
                                                     x.coord = toroidal_boundary_x(x.coord = x.coord,
                                                                                   number.of.tiles.width = number.of.tiles.width),
                                                     y.coord = toroidal_boundary_y(y.coord = y.coord+1,
                                                                                   number.of.tiles.length = number.of.tiles.length),
                                                     generation = generation,
                                                     sim.array = sim.array,
                                                     conversion.factor = conversion.factor,
                                                     intercept = intercept,
                                                     half.population.bioassay.survival.resistance = half.population.bioassay.survival.resistance,
                                                     female.exposure.landscape = female.exposure.landscape)

tile.6.pop = adult_population_size_after_suppression(population.size.landscape = population.size.landscape,
                                                     deployment.landscape = deployment.landscape,
                                                     x.coord = toroidal_boundary_x(x.coord = x.coord+1,
                                                                                   number.of.tiles.width = number.of.tiles.width),
                                                     y.coord = toroidal_boundary_y(y.coord = y.coord-1,
                                                                                   number.of.tiles.length = number.of.tiles.length),
                                                     generation = generation,
                                                     sim.array = sim.array,
                                                     conversion.factor = conversion.factor,
                                                     intercept = intercept,
                                                     half.population.bioassay.survival.resistance = half.population.bioassay.survival.resistance,
                                                     female.exposure.landscape = female.exposure.landscape)

tile.7.pop = adult_population_size_after_suppression(population.size.landscape = population.size.landscape,
                                                     deployment.landscape = deployment.landscape,
                                                     x.coord = toroidal_boundary_x(x.coord = x.coord+1,
                                                                                   number.of.tiles.width = number.of.tiles.width),
                                                     y.coord = toroidal_boundary_y(y.coord = y.coord,
                                                                                   number.of.tiles.length = number.of.tiles.length),
                                                     generation = generation,
                                                     sim.array = sim.array,
                                                     conversion.factor = conversion.factor,
                                                     intercept = intercept,
                                                     half.population.bioassay.survival.resistance = half.population.bioassay.survival.resistance,
                                                     female.exposure.landscape = female.exposure.landscape)

tile.8.pop = adult_population_size_after_suppression(population.size.landscape = population.size.landscape,
                                                      deployment.landscape = deployment.landscape,
                                                      x.coord = toroidal_boundary_x(x.coord = x.coord+1,
                                                                                    number.of.tiles.width = number.of.tiles.width),
                                                      y.coord = toroidal_boundary_y(y.coord = y.coord+1,
                                                                                    number.of.tiles.length = number.of.tiles.length),
                                                      generation = generation,
                                                      sim.array = sim.array,
                                                      conversion.factor = conversion.factor,
                                                      intercept = intercept,
                                                      half.population.bioassay.survival.resistance = half.population.bioassay.survival.resistance,
                                                      female.exposure.landscape = female.exposure.landscape)

#Get the disersal values
home.dispersal = (1 - dispersal.landscape[y.coord, x.coord])

tile.1.dispersal = (dispersal.landscape[toroidal_boundary_y(y.coord = y.coord-1,
                                                            number.of.tiles.length = number.of.tiles.length),
                                        toroidal_boundary_x(x.coord = x.coord - 1,
                                                            number.of.tiles.width = number.of.tiles.width)]/8)

tile.2.dispersal = (dispersal.landscape[toroidal_boundary_y(y.coord = y.coord-1,
                                                            number.of.tiles.length = number.of.tiles.length),
                                        toroidal_boundary_x(x.coord = x.coord,
                                                            number.of.tiles.width = number.of.tiles.width)]/8)

tile.3.disersal = (dispersal.landscape[toroidal_boundary_y(y.coord = y.coord-1,
                                                           number.of.tiles.length = number.of.tiles.length),
                                       toroidal_boundary_x(x.coord = x.coord+1,
                                                           number.of.tiles.width = number.of.tiles.width)]/8)

tile.4.dispersal= (dispersal.landscape[toroidal_boundary_y(y.coord = y.coord,
                                                           number.of.tiles.length = number.of.tiles.length),
                                       toroidal_boundary_x(x.coord = x.coord-1,
                                                           number.of.tiles.width = number.of.tiles.width)]/8)

tile.5.dispersal=  (dispersal.landscape[toroidal_boundary_y(y.coord = y.coord,
                                                            number.of.tiles.length = number.of.tiles.length),
                                        toroidal_boundary_x(x.coord = x.coord+1,
                                                            number.of.tiles.width = number.of.tiles.width)]/8)

tile.6.dispersal=(dispersal.landscape[toroidal_boundary_y(y.coord = y.coord+1,
                                                          number.of.tiles.length = number.of.tiles.length),
                                      toroidal_boundary_x(x.coord = x.coord-1,
                                                          number.of.tiles.width = number.of.tiles.width)]/8)

tile.7.dispersal= (dispersal.landscape[toroidal_boundary_y(y.coord = y.coord+1,
                                                           number.of.tiles.length = number.of.tiles.length),
                                       toroidal_boundary_x(x.coord = x.coord,
                                                           number.of.tiles.width = number.of.tiles.width)]/8)

tile.8.dispersal=   (dispersal.landscape[toroidal_boundary_y(y.coord = y.coord+1,
                                                             number.of.tiles.length = number.of.tiles.length),
                                         toroidal_boundary_x(x.coord = x.coord+1,
                                                             number.of.tiles.width = number.of.tiles.width)]/8)


numerator = (home.tile*home.tile.pop*home.dispersal) +
            (tile.1 * tile.1.pop * tile.1.dispersal) +
            (tile.2 * tile.2.pop * tile.2.dispersal)+
            (tile.3 * tile.3.pop * tile.3.disersal)+
            (tile.4 * tile.4.pop * tile.4.dispersal)+
            (tile.5 * tile.5.pop * tile.5.dispersal)+
            (tile.6 * tile.6.pop * tile.6.dispersal)+
            (tile.7 * tile.7.pop * tile.7.dispersal)+
            (tile.8 * tile.8.pop * tile.8.dispersal)

denominator = (home.tile.pop*home.dispersal) +
              (tile.1.pop * tile.1.dispersal) +
              (tile.2.pop * tile.2.dispersal)+
              (tile.3.pop * tile.3.disersal)+
              (tile.4.pop * tile.4.dispersal)+
              (tile.5.pop * tile.5.dispersal)+
              (tile.6.pop * tile.6.dispersal)+
              (tile.7.pop * tile.7.dispersal)+
              (tile.8.pop * tile.8.dispersal)

resistance.after.migration = numerator/denominator

#set to zero if NA (aka there are no mosquitoes surviving at all)
resistance.after.migration = ifelse(is.na(resistance.after.migration),
                                    yes = 0,
                                    no = resistance.after.migration)

return(resistance.after.migration)

}


