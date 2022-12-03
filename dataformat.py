# Import the required packages
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
import mysql.connector
from mysql.connector import Error
import random 

#database connection
def create_connection(host_name, user_name, user_password, db):
    connection = None
    try:
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            passwd=user_password,
            db=db
        )
        print("Connection to MySQL DB successful")
    except Error as e:
        print("The error '{e}' occurred")
    return connection
connection = create_connection("localhost", "root", "mana@2812", "movie_ticket_reservation")
cursor = connection.cursor()


# # # Load data
df = pd.read_csv('movies_dataset.csv',encoding='latin-1')
#Removed rows with null values
df2 = df.iloc[:6007]
df2=df2.drop_duplicates(subset=['Movie'])
df2 = df2.dropna(subset=['Duration','Genre'])
rating=[]
# #Updated empty values of rating column
for i in df2['Rating']:
    if type(i)==str:
        rating.append(i)
    elif type(i) ==float:
        rating.append(round(random.uniform(1.0,10.0),1))
df2['Rating']=rating
df2.to_csv('updated.csv',index=False)
# print(len(df2))

movies=[]
c=1
for index,row in  df2.iterrows():
    movie_details=[]
    movie_details.append(c)
    movie_details.append(row["Movie"])
    movie_details.append(int(row["Years"]))
    movie_details.append(int(row["Duration"].split()[0]))
    movie_details.append(float(row["Rating"]))
    movies.append(movie_details)
    c=c+1

# print(movies)
# #insert data into movie table
for movie in movies:
    cursor.execute('''insert into movie (movie_id, name, released_year, runtime, rating)  values (%s, %s, %s, %s, %s)''', (movie[0], movie[1], movie[2], movie[3], movie[4]))
connection.commit()


# # #extract unique values of genre column
genres_list = df2['Genre']
genres=[]
genre_map={}
for genre in genres_list:
    if type(genre) == str:
        for i in genre.split(","):
            if i not in genres:
                genres.append(i.strip())

genres=np.unique(genres)

for i, genre in enumerate(genres):
    genre_map[genre]=i+1

# #Insert data into "genre" table
for i in range(len(genres)):
    cursor.execute('''insert into genre (genre_id, genre)  values (%s, %s)''', (i+1, genres[i]))
connection.commit()

# # #extract unique values of actor 1 column, actor 2 column and actor 3 column
stars = list(df2['Actor_1'].unique()) +list(df2['Actor_2'].unique()) + list(df2['Actor_3'].unique()) + list(df2['Actor_4'].unique())
stars = np.unique(stars)

# # #insert stars into stars table in the database
for i in range(len(stars)):
    cursor.execute('''insert into stars (star_id, name)  values (%s, %s)''', (i+1, stars[i]))
connection.commit()

# # Map each  star with unique id
stars_name_map={}
for i in range(len(stars)):
    stars_name_map[stars[i]]=i+1

# # Map each  movie with unique id
movie_names=[]
movie_name_map=dict()
for movie in df2["Movie"]:
    movie_names.append(movie)

movie_map_indexes=[x+1 for x in range(len(movie_names))]
movie_name_map=dict(zip(movie_names,movie_map_indexes))
movie_stars={}

# # # created maps to map each movie with its stars and genres
movie_genre_map={}
movie_stars_map=dict()
for index, row in df2.iterrows():     
    try:
        genre = row["Genre"].split(",")
        actors_list=[]
        if type(row["Actor_1"])!=float:
            actors_list.append(stars_name_map[row["Actor_1"]])
        if type(row["Actor_2"])!=float:
            actors_list.append(stars_name_map[row["Actor_2"]])
        if type(row["Actor_3"])!=float:
            actors_list.append(stars_name_map[row["Actor_3"]])
        if type(row["Actor_4"])!=float:
            actors_list.append(stars_name_map[row["Actor_4"]])
        movie_stars_map[movie_name_map[row["Movie"]]]=actors_list
        movie_genre_map[movie_name_map[row["Movie"]]]=genre
    except:
        print(row["Movie"])

movie_stars_list=[]
for movie_id, stars_list in movie_stars_map.items():
    for star in stars_list:
        movie_stars_list.append([movie_id, star])

# # #insert data into movie_stars table in the database
for i in range(len(movie_stars_list)):
    print(movie_stars_list[i][0], movie_stars_list[i][1])
    try:
        cursor.execute('''insert into movie_stars (movie_id,star_id)  values (%s, %s)''', (movie_stars_list[i][0], movie_stars_list[i][1]))
    except:
        print(movie_stars_list[i][0], movie_stars_list[i][1])
connection.commit()

# # #Created List to insert mapping of movie and genre into movie_genre table
movie_genre_list=[]
for movie_id, genre_list in movie_genre_map.items():
    for genre in genre_list:
        movie_genre_list.append([movie_id, genre_map[genre.strip()]])

# # #insert data into movie_genre table in the database
for i in range(len(movie_genre_list)):
    try:
        cursor.execute('''insert into movie_genre (movie_id, genre_id)  values (%s, %s)''', (movie_genre_list[i][0], movie_genre_list[i][1]))
    except:
        print(movie_genre_list[i][0], movie_genre_list[i][1])

connection.commit()


    


# # # # Load data
# df3 = pd.read_csv('movies_dataset.csv',encoding='latin-1')

# # # # extract unqiue values from city column
# cities = df3['city'].unique()

# # # #create map of cities and unique id
# city_map = {}
# for i, city in enumerate(cities):
#     city_map[city] = i+1

# # print(city_map)

# # #create map of values from theatre_name column to no_screens columns and value of city from city_map for city column 
# # df['city'] = df['city'].map(city_map)
# # df['theatre_name'] = df['theatre_name']
# # df['no_screens'] = df['no_screens']

# # print(df)

# # print(df.head())
# # # theatres = df['theatre_name'].values
# # # screens = df['no_screens'].values
# # # city = [city_map[city] for city in df['city'].values]

# # # theater_map = dict(zip(df['theatre_name'], df['no_screens'], [city_map[city] for city in df['city']]))
# # # print(theater_map)
# # city_map={}
# # # print(cities)





