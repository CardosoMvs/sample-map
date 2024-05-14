# Carregar as bibliotecas necessárias
library(sf)
library(ggplot2)
library(here)

# Configurar o caminho para os shapefiles
shapefile_path <- here("D:/0_Projetos/5_Extras/Mapear amostras/01-febr_superconjunto-processed_granulometry/01-febr_superconjunto-processed_granulometry.shp")
brasil_shapefile_path <- here("D:/0_Projetos/5_Extras/Mapear amostras/Lim_america_do_sul_IBGE_2021/Lim_america_do_sul_2021.shp") 

# Carregar os dados dos shapefiles
spatial_points <- st_read(shapefile_path)
brasil_map <- st_read(brasil_shapefile_path)

# Criar o mapa usando ggplot2
ggplot() +
  geom_sf(data = brasil_map, fill = "white") +  # Adiciona o mapa do Brasil com cor de fundo clara
  geom_sf(data = spatial_points, color = "red", fill = "red", size = 1) +  # Adiciona os pontos
  theme_minimal() +
  labs(title = "",
       caption = "") +
  coord_sf(xlim = c(-74, -34), ylim = c(-35, 5), expand = FALSE) # Limites ajustados para focar no Brasil

#Salvar em png 

ggsave("D:/0_Projetos/5_Extras/Mapear amostras/samples_map_granulometry.png")