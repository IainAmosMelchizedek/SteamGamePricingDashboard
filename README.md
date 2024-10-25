Steam Game Pricing Dashboard
Overview
This project uses R Shiny to build an interactive dashboard for analyzing a dataset of Steam games. The objective of this analysis is to optimize pricing strategies by exploring correlations between game prices, player metrics, and other features. The dashboard allows users to filter the dataset by price range and visualize relationships between price and various game attributes.

Features
The dashboard includes the following interactive elements:

Price Range Slider: Allows users to filter the dataset based on game prices (from $0 to $75).
Price Distribution Histogram: Visualizes the distribution of prices for games within the selected price range.
Scatter Plot for Price Correlations: Enables users to explore correlations between price and other numeric metrics (e.g., estimated owners, positive reviews).
Summary Statistics: Displays key statistics (e.g., average price, median price) for the selected price range.
Data Table: Shows a 2% sample of the dataset, displaying 8 selected columns and 10 rows of filtered data.
Data
The project uses a dataset of Steam games, which includes attributes such as:

Game prices
Estimated number of owners
Positive and negative reviews
Metacritic scores
Number of achievements
Various game features (developers, genres, categories)
Note: For testing purposes, the dataset was reduced to 5% of its original size to improve performance, and the table display was further reduced to 2%.

Setup Instructions
To run the app locally, follow these steps:

Clone or Download the Repository:

Clone the repository using Git:
bash
Copy code
git clone https://github.com/YourUsername/SteamGamePricingDashboard.git
Alternatively, download the project as a ZIP file and extract it.
Ensure You Have R and RStudio Installed:

You will need R and RStudio installed to run the project. You can download R from here and RStudio from here.
Install Necessary Packages:

Open the SteamGameDashboard.R script in RStudio.
Run the following command to install the required R packages:
r
Copy code
install.packages(c("shiny", "ggplot2", "dplyr", "readr", "DT"))
Run the Shiny App:

Set the working directory to the folder where the SteamGameDashboard.R script and Output_P2.csv dataset are located.
In RStudio, run the script:
r
Copy code
shiny::runApp("SteamGameDashboard.R")
View the Dashboard:

Once the app is running, you will be able to interact with the dashboard in your web browser.
Project Structure
SteamGameDashboard.R: The main R script that contains the code for the dashboard.
Output_P2.csv: The dataset used in this analysis.
README.md: This file, providing an overview of the project and instructions for setup.
License
This project is open source and available under the MIT License.