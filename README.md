# MOVIE TICKET RESERVATION AND RECOMMENDATION SYSTEM
 
Team Members
 
Anshul Sharma (002789548) - sharma.ansh@northeastern.edu

Manashree Patel (002770365) - patel.manas@northeastern.edu

Soham Deshpande (002752873) - deshpande.soha@northeastern.edu

# Movie-Reservation-and-Recommendation-System

## Objective:

The project's goal is to develop a movie reservation and recommendation system
that will make reservations for customers easier by giving them valuable information
without any hassle. The system would be helpful in the following ways:

● Making services widely accessible to customers will result in a decrease in the
number of people using the ticket window to buy tickets, which in turn will
save time and reduce business costs.

● Customer satisfaction is increased since it's simple for them to view the
available movies and make bookings in line with them.

● Improve the theater utilization by knowing how many people will attend each
performance, theaters can better allocate their resources.

● A movie reservation system can offer valuable information about a customer's
movie-watching preferences, which can be utilized to enhance the experience
as a whole.

## Scope:

The system should be able to handle the following:

● Users should be able to search for movies by title, genre, or actor/actress.

● Users should be able to view movie showtimes in their cities and purchase
tickets.

● The system should keep track of tickets sold and available seats.

● The system will keep track of movie gross income in the region.

● Users should be able to rate movies they have seen.

● The system should be able to recommend similar movies to users based on
their ratings.

● Refer document “Movie Ticket Reservation Queries”
  
  ● Run the 7 Common Twitter Queries Use Cases and 16 (5 per group member) Individual Queries Use Cases to get corresponding answers

● Refer the “twitterSnScrap.py” Twitter Bot python file to extract it - 
  
  ● Once you run the python file it will 2 user inputs
    
    ● Tweet ID - Take any ID from the database - “twitter_tweets” table
    
    ● Twitter Handle - Take any Twitter Handle from the database - “twitter_tweets” table

● The Entity- Relationship Diagram is available in the png file - “ERD_FINAL_10.0.png”

● Note: Please refer folder name - "INSERT SQL" to Create and Insert the Data into the Database.


## Steps followed throughout the project:

● We researched and found the dataset for the selected topic. It is mentioned in the links below:

  ● Dataset 1 - https://data.world/adrianmcmahon/imdb-dataset-all-indian-movies

  ● Dataset 2 - https://github.com/MostafaMhussein/-Project-EDA-For-IMDB-Movies-Dataset/blob/master/EDA%20For%20IMDB%20Movies%20Dataset.ipynb

● Further, we created the schema using MySQL Workbench

● Processes like Cleaning, Munging and Scraping were performed on the datasets using python

● Web scrapped data from twitter and linked it with movie_database for the twitter bot assignment

● We inserted this data into the database and normalized it

● Further, we studied the database and created a few use cases and its queries, followed by creating its views


## Git Files
● dataformat.py - python script to format data from movies_dataset.csv and fits into database

● twitterScrap.py - python script to scrape data from twitter of specific movies

● movies_dataset.csv - Original dataset used for database from https://data.world/

● indian-movie-theaters.csv - dataset used for fetching data for theaters

● plots.ipynb - graphs for data visualization

