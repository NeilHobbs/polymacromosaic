A = run_mosaic_simulation(number.of.tiles.width = 11,
                          number.of.tiles.length = 11,
                          number.of.insecticides = 1,
                          min.male.exposure = 0.7,
                          max.male.exposure = 0.7,
                          min.female.exposure = 0.7,
                          max.female.exposure = 0.7,
                          min.heritability = 0.2,
                          max.heritability = 0.2,
                          min.dispersal = 0.1,
                          max.dispersal = 0.1,
                          exposure.scaling.factor = 10,
                          min.fitness.cost = 0.01,
                          max.fitness.cost = 0.01,
                          maximum.generations = 200,
                          intervention.coverage = 0.6,
                          population.size = 10000,
                          half.population.bioassay.survival.resistance = 900,
                          conversion.factor = 0.48,
                          intercept = 0.15)

#xcoord , ycoord , generation , insecticide deployed , insecticide tracked, resistance

final_df = get_simulation_dataframe_mosaics(number.of.tiles.width = 11,
                                            number.of.tiles.length = 11,
                                            number.of.insecticides = 1,
                                            maximum.generations = 200,
                                            simulation.output = A)



library(magrittr)
final_df2 = final_df%>%
  dplyr::filter(insecticide.tracked == 1)%>%
  dplyr::filter(generation == 200)
library(ggplot2)

ggplot(final_df2, aes(x=xcoord,
                      y=ycoord))+
  geom_tile(aes(fill = resistance),
            colour = "white") +
  xlab("x coordinate")+
  ylab("y coordinate")+
  geom_text(aes(label = insecticide.deployed), colour = "black") +
  scale_fill_gradientn(colours = rev(c("#d73027", "#f46d43", "#fdae61", "#abd9e9", "#74add1", "#4575b4")))+
  theme_bw()



final_df3 = final_df%>%
  dplyr::filter(insecticide.tracked == 1)



  final_df2 = final_df%>%
    dplyr::filter(insecticide.tracked == 1)%>%
    dplyr::filter(generation == 10)

  ggplot(final_df2, aes(x=xcoord,
                        y=ycoord))+
    geom_tile(aes(fill = resistance),
              colour = "white") +
    xlab("x coordinate")+
    ylab("y coordinate")+
    geom_text(aes(label = insecticide.deployed), colour = "black") +
    scale_fill_gradientn(colours = rev(c("#d73027", "#f46d43", "#fdae61", "#abd9e9", "#74add1", "#4575b4")))+
    theme_bw()





library(gganimate)

animation.plot = ggplot(final_df3, aes(x=xcoord,
                                       y=ycoord))+
  geom_tile(aes(fill = resistance),
            colour = "white") +
  xlab("x coordinate")+
  ylab("y coordinate")+
  geom_text(aes(label = insecticide.deployed), colour = "black") +
  scale_fill_gradientn(colours = rev(c("#d73027", "#f46d43", "#fdae61", "#abd9e9", "#74add1", "#4575b4")))+
  theme_bw()+
  transition_states(generation)+
  labs(title = 'generation: {closest_state}')+
  ease_aes('linear')

animate(animation.plot, renderer = gifski_renderer())


