toroidal_boundary_x = function(x.coord,
                               number.of.tiles.width){

new.x.coord = ifelse(x.coord > number.of.tiles.width,
                     yes = 1,
                     no = ifelse(x.coord < 1,
                                 yes = number.of.tiles.width,
                                 no = x.coord))

return(new.x.coord)

}
