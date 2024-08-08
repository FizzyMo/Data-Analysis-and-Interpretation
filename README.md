# News Article Data Analysis and Interpretation
The goal of this project is to use R to analyze and evaluate news article data. The project is divided into two components: data analysis and data interpretation. The analysis was carried out in R, where I parsed JSON data, examined the dataset, and created visualizations. Understanding the results and generating conclusions from the examined data are both part of the interpretation process.

## Table of Contents

- [Project Structure](#project-structure)
- [Technology Used](#technology-used)
- [Data Analysis](#data-analysis)
  - [Reading JSON Data](#reading-json-data)
  - [Cleaning and Transforming Data](#cleaning-and-transforming-data)
  - [Analyzing Source Counts](#source-counts)
  - [Visualizing Source Distribution](#visualizing-sources)
- [Interpreting News Source Counts](#interpreting-news-source-counts)
- [How to Run the Analysis](#how-to-run)
- [Example Output](#example-output)
- [Author](#author)
- [Contact](#contact)

## Project Structure

```
project-root
├── data
│   ├── articles.json
│   └── source_counts.csv
├── video
│   └── console.log.gif
├── outputs
│   └── Rplots.pdf
├── main.r
└── README.md
```
* `data/articles.json`: JSON file containing the raw news articles data.
* `data/source_counts.csv`: CSV file with the count of articles from each source.
* `video/console.log.gif`: GIF showing the console log of the R script execution.
* `outputs/Rplots.pdf`: PDF file containing the bar plot visualizing the number of articles by source.
* `main.r`: R script for data analysis and visualization.

## Technology Used
This project was developed using the following technologies:
* **R:** For data analysis and visualization.
* **Replit:** The development environment where the program was written and executed.

## Data Analysis
### Reading JSON Data
The analysis begins by reading the news articles data from a JSON file using the `jsonlite` package in R.

```
# Load necessary packages (if not already installed)
if (!require("jsonlite")) {
  install.packages("jsonlite")
}
library(jsonlite)

# Read Data from JSON File 
articles_data <- fromJSON("data/articles.json")
```
### Cleaning and Transforming Data
The articles are converted into a data frame, and initial exploratory data analysis is performed to check for missing values and understand the structure of the data.

```
# Access the articles as a data frame
articles_df <- as.data.frame(articles_data$articles)

# Check for missing values
colSums(is.na(articles_df))

# Count of articles from each source
source_counts <- table(articles_df$source)
```
### Analyzing Source Counts
The source counts are calculated, and the data is saved to a CSV file for further analysis and interpretation.

```
source_counts_df <- as.data.frame(source_counts)
colnames(source_counts_df) <- c("Source", "Count")  # Rename columns for clarity

# Write the data frame to a CSV file
write.csv(source_counts_df, file = "data/source_counts.csv", row.names = FALSE)
```

### Visualizing Source Distribution
A bar plot is generated to visualize the number of articles from each source. The plot is saved as a PDF in the `outputs` directory.

```
# Create a bar plot for source counts (sorted in descending order)
barplot(sort(source_counts, decreasing = TRUE),
        main = "Number of Articles by Source",
        ylab = "Count",
        las = 2,  
        cex.names = 0.6)
mtext("Source", side = 1, line = 5, cex = 0.8)

# Move the Rplots.pdf file to the outputs folder
file.rename("Rplots.pdf", "outputs/Rplots.pdf")
```

## Interpreting News Source Counts
The analysis provides insights into the distribution of news articles across different sources. By examining the `source_counts.csv` and the `Rplots.pdf`, you can interpret which sources contribute most heavily to the dataset and explore potential biases or trends.

## How to Run the Analysis
1. Clone the repository: `git clone https://github.com/yourusername/project-name.git`
`cd project-name`
2. Run the R script to perform the analysis:
`Rscript main.r`
3. Review the output files:
   - `data/source_counts.csv` for the article counts per source.
   - `outputs/Rplots.pdf` for the visual representation of the source counts.

## Example Output
Example console output<br>
![](video/console.log.gif)

## Author
**Carisa Saenz-Videtto**

## Contact
carisasaenz@gmail.com