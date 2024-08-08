# Load necessary packages (if not already installed)
if (!require("jsonlite")) {
  install.packages("jsonlite")
}
library(jsonlite)

# Read Data from JSON File 
articles_data <- fromJSON("data/articles.json")

# Access the total number of results
total_results <- articles_data$totalResults

# Access the articles as a data frame
articles_df <- as.data.frame(articles_data$articles)

# View the structure of the data frame
str(articles_df)

# View the first few rows of the data frame
head(articles_df)

# Check for missing values
colSums(is.na(articles_df))

# Count of articles from each source
source_counts <- table(articles_df$source)
source_counts_df <- as.data.frame(source_counts)
colnames(source_counts_df) <- c("Source", "Count")  # Rename columns for clarity

# Write the data frame to a CSV file
write.csv(source_counts_df, file = "data/source_counts.csv", row.names = FALSE)

# Print out the data frame to confirm
print(source_counts_df)

# Adjust bottom margin to accommodate long labels
par(mar = c(7, 2, 3, 3) + 0.9)

# Create a bar plot for source counts (sorted in descending order)
barplot(sort(source_counts, decreasing = TRUE),
              main = "Number of Articles by Source",
              ylab = "Count",
              las = 2,  
              cex.names = 0.6) 
mtext("Source", side = 1, line = 5, cex = 0.8)

# Move the Rplots.pdf file to the data folder
file.rename("Rplots.pdf", "data/Rplots.pdf")