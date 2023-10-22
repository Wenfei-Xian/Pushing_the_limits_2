library(ggplot2)

data <- read.table("Orthogroups.GeneCount.csv.gz", header=TRUE, stringsAsFactors=FALSE, sep="\t")
non_zero_counts <- apply(data[,-1], 1, function(row) sum(row > 0))

thresholds <- 1:100
counts <- sapply(thresholds, function(threshold) sum(non_zero_counts >= threshold))

plot_data <- data.frame(threshold = thresholds, count = counts)

y_value_at_20 <- plot_data$count[plot_data$threshold == 21]

p <- ggplot(plot_data, aes(x=threshold, y=count)) +
  geom_point() +
  geom_vline(aes(xintercept=21), linetype="dashed", color="red") +
  geom_text(aes(x=21, y=y_value_at_20, label=y_value_at_20), vjust=-0.5, hjust=-0.2, color="blue") +  # This line adds the label
  labs(title="Distribution of Orthologous Groups",
       x="Number of Species in which Each Orthologous Group is Present", 
       y="Number of Orthologous Groups") +
  theme_minimal()

print(p)
print(plot_data)
