#### Count Species ####
# Applies reused count formatting, pipe friendly format.
# Counts species conservation values and draws a stacked bar chart.

count_species <- function(df) {
  
  result <- df %>%
    
    #Cut table to conservation values, count them for each species.
    select(human, ape_pantr, mouse, zebrafish_danre) %>%
    lapply(count) %>%
    bind_rows(.id = "Species") %>%
  
    #Rename species names to nicer formatting.
    mutate(Species = recode(Species, human = "Human", mouse = "Mouse", 
                            ape_pantr = "Ape", zebrafish_danre = "Zebrafish")) %>%
    
    #Plot on stacked bar chart.
    ggplot(aes(fill=x, y=freq, x=Species)) + 
    geom_bar(position="stack", stat="identity") +
    xlab("") +
    ylab("Frequency") + 
    scale_fill_brewer(palette = "Set1", labels = c("Unconserved", "Unknown", "Conserved")) +
    labs(fill = "Site") +
    guides(fill = guide_legend(reverse=TRUE)) +
    theme(panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(),
          panel.background = element_blank(),
          axis.line = element_line(colour = "black"))
  
  #Pass chart back to program.
  return(result)

}


