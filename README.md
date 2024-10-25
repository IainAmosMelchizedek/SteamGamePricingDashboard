# Steam Game Pricing Dashboard

## Overview
This project uses **R Shiny** to build an interactive dashboard for analyzing a dataset of Steam games. The objective of this analysis is to optimize pricing strategies by exploring correlations between game prices, player metrics, and other features.

## Features
The dashboard includes the following interactive elements:
1. **Price Range Slider**: Allows users to filter the dataset by game prices (from $0 to $75).
2. **Price Distribution Histogram**: Visualizes the distribution of prices for games within the selected price range.
3. **Scatter Plot for Price Correlations**: Enables users to explore correlations between price and other numeric metrics (e.g., estimated owners, positive reviews).
4. **Summary Statistics**: Displays key statistics (e.g., average price, median price) for the selected price range.
5. **Data Table**: Shows a 2% sample of the dataset, displaying 8 selected columns and 10 rows of filtered data.

## Data
The project uses a dataset of Steam games, which includes attributes such as:
- Game prices
- Estimated number of owners
- Positive and negative reviews
- Metacritic scores
- Number of achievements
- Various game features (developers, genres, categories)

**Note**: For testing purposes, the dataset was reduced to **5% of its original size** to improve performance, and the table display was further reduced to **2%**.

## Setup Instructions
To run the app locally, follow these steps:

1. **Clone or Download the Repository**:
   - Clone the repository using Git:
     ```
     git clone https://github.com/YourUsername/SteamGamePricingDashboard.git
     ```
   - Alternatively, download the project as a ZIP file and extract it.

2. **Ensure You Have R and RStudio Installed**:
   - You will need **R** and **RStudio** installed to run the project. You can download R from [here](https://www.r-project.org/) and RStudio from [here](https://rstudio.com/products/rstudio/download/).

3. **Install Necessary Packages**:
   - Open the `SteamGameDashboard.R` script in RStudio.
   - Run the following command to install the required R packages:
     ```r
     install.packages(c("shiny", "ggplot2", "dplyr", "readr", "DT"))
     ```

4. **Run the Shiny App**:
   - Set the working directory to the folder where the `SteamGameDashboard.R` script and `Output_P2.csv` dataset are located.
   - In RStudio, run the script:
     ```r
     shiny::runApp("SteamGameDashboard.R")
     ```

5. **View the Dashboard**:
   - Once the app is running, you will be able to interact with the dashboard in your web browser.

## Project Structure
- **`SteamGameDashboard.R`**: The main R script that contains the code for the dashboard.
- **`Output_P2.csv`**: The dataset used in this analysis.
- **README.md**: This file, providing an overview of the project and instructions for setup.

## License
This project is open source and available under the [MIT License](https://opensource.org/licenses/MIT).
