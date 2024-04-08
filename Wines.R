# import dataframes
df1 <- read.csv('winequality-red.csv', sep = ";")
df2 <- read.csv('winequality-white.csv', sep = ";")

df1$label <- 'red'
df2$label <- 'white'

head(df1)

wine <- rbind(df1, df2)

str(wine)

install.packages("ggplot2")
library(ggplot2)

# Create custom fill colors
colors <- c("red", "white")  # Define colors for 'red' and 'white' labels

# Histogram of residual sugar from the wine data. Color by red and white wines.
ggplot(wine, aes(residual.sugar, fill = label)) +
  geom_histogram(binwidth = 2, color = "black") +
  scale_fill_manual(values = colors)


# Histogram of citric.acid from the wine data. Color by red and white wines.
ggplot(wine, aes(citric.acid, fill = label)) +
  geom_histogram(bins = 30, color = "black") +
  scale_fill_manual(values = colors)

# Histogram of alcohol from the wine data. Color by red and white wines.
ggplot(wine, aes(alcohol, fill = label)) +
  geom_histogram(bins = 35, color = "black") +
  scale_fill_manual(values = colors)

# scatterplot of residual.sugar versus citric.acid, color by red and white wine.
ggplot(wine, aes(citric.acid, residual.sugar, color = label)) +
  geom_point(alpha = 0.2) +  # Setting alpha value to 0.7 for 30% transparency
  scale_color_manual(values = c("red", "white")) +  # Specify custom colors for 'red' and 'white' labels
  theme_dark()

# scatterplot of volatile.acidity versus residual.sugar, color by red and white wine.
ggplot(wine, aes(volatile.acidity, residual.sugar, color = label)) +
  geom_point(alpha = 0.2) +  # Setting alpha value to 0.7 for 30% transparency
  scale_color_manual(values = c("red", "white")) +  # Specify custom colors for 'red' and 'white' labels
  theme_dark()

clus.data <- wine[,1:12]

set.seed(101)

wine.cluster <- kmeans(clus.data, 2, nstart = 20)

wine.cluster

table(wine.cluster$cluster, wine$label)

library(cluster)

clusplot(wine, wine.cluster$cluster, color = TRUE, shade = T, labels=0, lines=0)

help("clusplot")
