install.packages("tidyverse")

ncaa_pts <- read.csv("ncaa_pts.csv")

head(ncaa_pts)

ncaa_pts2 <- mutate(ncaa_pts, pts_dif = win_pts - lose_pts)
ncaa_pts3 <- mutate(ncaa_pts2, seed_dif = win_seed - lose_seed)
ncaa_pts3_highseedwins <- subset (ncaa_pts3, seed_dif < 0)
ggplot(ncaa_pts3, aes(seed_dif, win_pts)) + geom_point()

ggplot(ncaa_pts3, aes(seed_dif, lose_pts)) + geom_point()

ggplot(ncaa_pts3, aes(seed_dif)) +geom_density() +
  labs(title = 'Wins from Seed Differential', subtitle = 'The full tournament')

round_64 <- subset(ncaa_pts3, round == 64)
round_64_highseedwins <- subset (round_64, seed_dif < 0)

ggplot(round_64, aes(seed_dif)) +geom_density() +
labs(title = 'Wins from Seed Differential', subtitle = 'Round of 64')

round_64 %>%
  summarize(mean(seed_dif), sd(seed_dif))

ncaa_pts3 %>%
  top_n(10, pts_dif) %>%
  ggplot() + aes(seed_dif, pts_dif, color = win_school_ncaa) + geom_point() +
  labs(title = 'Games with Highest Point Differential')

ncaa_pts3 %>%
  top_n(-10, lose_pts) %>%
  ggplot() + aes(seed_dif, pts_dif, color = win_school_ncaa) + geom_point() +
  labs(title = 'Games where the winner held their oppenents to the least points')

ncaa_pts3 %>%
  top_n(-10, pts_dif) %>%
  ggplot() + aes(seed_dif, pts_dif, color = win_school_ncaa) + geom_point()

ncaa_pts3 %>%
  summarize(mean(seed_dif), sd(seed_dif))

  
