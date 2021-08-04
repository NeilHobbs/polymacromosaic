A = run_mosaic_simulation(number.of.tiles.width = 3,
                          number.of.tiles.length = 1,
                          number.of.insecticides = 2,
                          min.male.exposure = 0.8,
                          max.male.exposure =0.8,
                          min.female.exposure = 0.9,
                          max.female.exposure = 0.9,
                          min.heritability = 0.3,
                          max.heritability = 0.3,
                          min.dispersal = 0.3,
                          max.dispersal = 0.3,
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

final_df = get_simulation_dataframe_mosaics(number.of.tiles.width = 3,
                                            number.of.tiles.length = 1,
                                            number.of.insecticides = 2,
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

animate(animation.plot)


plot.list = list()
for(i in 1:200){
  final_df4 = final_df3%>%
    dplyr::filter(generation == i)
  
  
  plot.list[[i]] = ggplot(final_df4, aes(x=xcoord,
                                       y=ycoord))+
  geom_tile(aes(fill = resistance),
            colour = "white") +
  xlab("x coordinate")+
  ylab("y coordinate")+
  geom_text(aes(label = insecticide.deployed), colour = "black") +
  scale_fill_gradientn(colours = rev(c("#d73027", "#f46d43", "#fdae61", "#abd9e9", "#74add1", "#4575b4")),  limits=c(0,130))+
  theme_bw()

}

plot.list[[200]]

plot.list[[10]]



for (i in 1:200) {
  file_name = paste("generation", i, ".tiff", sep="")
  tiff(file_name)
  print(plot.list[[i]])
  dev.off()
}



