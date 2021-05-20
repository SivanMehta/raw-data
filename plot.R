library(ggplot2)
library(dplyr)

dat <- read.csv('costco.csv')

dense <- dat %>%
  mutate(Costcos = as.numeric(Costcos)) %>%
  mutate(Population = as.numeric(Population)) %>%
  mutate(density = 1000000 * Costcos / Population)

dense %>%
  na.omit() %>%
  ggplot() +
    aes(y = density, x = reorder(Region, density)) +
    geom_col() +
    coord_flip() +
    labs(y = "Costcos per million residents", x = "Region")
