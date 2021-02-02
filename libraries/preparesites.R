#### Prepare Sites Function ####
# Selects data to be used in deepphos which is altered often.
# sp and caspase should be a list of criteria.
# Parameters ordered to be pipe friendly.

prepare_sites <- function(df, sites, caspase="ALL", sp="ALL") {

  #Written to tolerate additional caspases and species if the input data is expanded.
  #"df <-" isn't redundant, removing it breaks statement. There is probably a nicer way. 
  if(caspase != "ALL") {
    df <- df %>% filter(cleaved_by %in% caspase)
  }
  if(sp != "ALL") {
    df <- df %>% filter(species %in% sp)
  }

  new_data <- df %>% filter(residue %in% sites)  %>% select(uniprot_id,site,sequence)
  return(new_data)
  
}


