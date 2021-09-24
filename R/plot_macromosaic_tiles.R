#will need to convert resistance to bioassay survival
plot_macromosaic_tiles = function(max.generations,
                                  number.insecticides,
                                  max.resistance,
                                  palette.type,
                                  sim.df){

  
 if(palette.type == "sequential"){palette.to.use =
                        c("#fff7f3", "#fde0dd", "#fcc5c0", "#fa9fb5",
                                "#f768a1", "#dd3497", "#ae017e", "#7a0177",
                                "#49006a")}
  if(palette.type == "diverging"){palette.to.use = rev(c("#d73027", "#f46d43", "#fdae61", "#abd9e9", "#74add1", "#4575b4"))}
  
    
plot.list.i = list()
plot.list.g = list()
for(i in 1:number.insecticides){
  for(g in 1:max.generations){
    sim.df.g.i = sim.df%>%
      dplyr::filter(generation == g)%>%
      dplyr::filter(insecticide.tracked == i)
    
    plot.list.g[[g]] = ggplot(sim.df.g.i, aes(x=xcoord,
                                           y=ycoord))+
      geom_tile(aes(fill = resistance)#,
                #colour = "white"
                ) +
      xlab("x coordinate")+
      ylab("y coordinate")+
      ggtitle(paste("Insecticide:",i, "at Generation:", g, collapse = ","))+
      geom_text(aes(label = insecticide.deployed), colour = "black") +
      scale_fill_gradientn(colours = palette.to.use,  limits=c(0,max.resistance))+
      theme_bw()
    
  }
  plot.list.i[[i]] = plot.list.g
}
return(plot.list.i)
}

# B = plot_macromosaic_tiles(200, 1, 100, "diverging", final_df)
# 
# B[[1]][[180]]


