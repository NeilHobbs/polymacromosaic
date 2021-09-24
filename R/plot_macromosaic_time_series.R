plot_macromosaic_time_series = function(max.generations,
                                  sim.df,
                                  number.tiles.width,
                                  number.tiles.length){
  total.tiles = (number.tiles.width*number.tiles.length)
  
unique.id = list()
  for(i in 1:total.tiles){
      unique.id[[i]] = rep(i, times = max.generations)
    }
    
  
sim.df$location.id= unlist(unique.id) 
  
final.plot = ggplot(sim.df, aes(x=generation, y=resistance,
                   colour = as.character(location.id)))+
  geom_line(size = 2,
            alpha = 0.5)+
  theme_classic()+
  theme(legend.position = "none")+
  facet_wrap(~insecticide.tracked)
  
  return(final.plot)
  
  
}

# plot_macromosaic_time_series(max.generations = 200,
#                              sim.df = final_df,
#                              number.tiles.width = 50,
#                              number.tiles.length = 50)
