library(tidyverse)
library(moderndive)

top_songs = filter(Spotify_SP22, popularity > 70)
worst_songs = filter(Spotify_SP22, popularity == 0)
view(worst_songs)
view(top_songs)

Spotify_SP22 = Spotify_SP22 %>% 
  mutate(popularity_category = ifelse(popularity > 66, "High", ifelse(popularity > 33, "Medium", "Low")))

ggplot(Spotify_SP22, aes(y = danceability, fill = popularity_category)) + 
  geom_boxplot() +
  labs(y = "Danceability", title = "Distribution of Danceability by Popularity") + 
  theme(title = element_text(colour = "purple")) + 
  theme(plot.title = element_text(hjust = 0.5))

ggplot(Spotify_SP22, aes(y = loudness, fill = popularity_category)) + 
  geom_boxplot() +
  labs(title = "Distribution of Loudness by Popularity") + 
  theme(title = element_text(colour = "blue")) + 
  theme(plot.title = element_text(hjust = 0.5))

ggplot(Spotify_SP22, aes(y = energy, fill = popularity_category)) + 
  geom_boxplot() +
  labs(y = "Energy", title = "Distribution of Energy by Popularity") + 
  theme(title = element_text(colour = "red")) + 
  theme(plot.title = element_text(hjust = 0.5))

ggplot(top_songs, aes(x = acousticness)) + 
  geom_histogram(col = "white", fill = "lightblue") + 
  labs(x= "Acousticness", y= "Number of Songs", title = "Distribution of Acousticness in Top Songs") +
  theme(title = element_text(colour = "darkgreen")) +
  theme(plot.title = element_text(hjust = 0.5))

ggplot(worst_songs, aes(x = acousticness)) +
  geom_histogram(col = "black", fill = "green") + 
  labs(x = "Acousticness", y = "Number of Songs", title = "Distribution of Acousticness in Least Popular Songs") +
  theme(title = element_text(colour = "darkgreen")) +
  theme(plot.title = element_text(hjust = 0.5))


h_pop = filter(Spotify_SP22, popularity_category == "High")
h_pop_1 = filter(h_pop, danceability == 0)

