toroidal_boundary_y = function(y.coord,
                               number.of.tiles.length){

  new.y.coord = ifelse(y.coord > number.of.tiles.length,
                       yes = 1,
                       no = ifelse(y.coord < 1,
                       yes = number.of.tiles.length,
                       no = y.coord))

  return(new.y.coord)

}
