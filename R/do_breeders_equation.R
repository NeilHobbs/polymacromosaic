do_breeders_equation = function(male.exposure,
                                female.exposure,
                                heritability,
                                exposure.scaling.factor){
  
  
  response = exposure.scaling.factor*heritability *(((1+male.exposure)*female.exposure)/2)
  
  return(response)
}
