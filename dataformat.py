# Import the required packages
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
import mysql.connector
from mysql.connector import Error
import random 
import os
import os.path
import shutil
d = os.getcwd()
# os.chdir("..")
o = [os.path.join(d,o) for o in os.listdir(d) if os.path.isdir(os.path.join(d,o))] # Gets all directories in the folder as a tuple

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
        print("The error occurred", e)
    return connection
connection = create_connection("localhost", "root", "root", "movie_ticket_reservation")
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

#remove duplicates  from movie_stars_list
movie_stars_list = list(map(list, set(map(tuple, movie_stars_list))))
# # #insert data into movie_stars table in the database
for i in range(len(movie_stars_list)):
    # print(movie_stars_list[i][0], movie_stars_list[i][1])
    try:
        cursor.execute('''insert into movie_stars (movie_id,star_id)  values (%s, %s)''', (movie_stars_list[i][0], movie_stars_list[i][1]))
    except Error as e:
        print("The error occurred", e)
        # print(movie_stars_list[i][0], movie_stars_list[i][1])
connection.commit()

# # #Created List to insert mapping of movie and genre into movie_genre table
movie_genre_list=[]
for movie_id, genre_list in movie_genre_map.items():
    for genre in genre_list:
        movie_genre_list.append([movie_id, genre_map[genre.strip()]])

# # #remove duplicates  from movie_genre_list
movie_genre_list = list(map(list, set(map(tuple, movie_genre_list))))

# # #insert data into movie_genre table in the database
for i in range(len(movie_genre_list)):
    try:
        cursor.execute('''insert into movie_genre (movie_id, genre_id)  values (%s, %s)''', (movie_genre_list[i][0], movie_genre_list[i][1]))
    except Error as e:
        print("The error occurred", e)

connection.commit()

for item in o:
    if os.path.exists(item + '\\Dataset Movies - Screens.csv'):
        file = item + '\\Dataset Movies - Screens.csv'

df4 = pd.read_csv(file,encoding='latin-1')

# insert df4 to screens table in the database
screens=[]
for index,row in  df4.iterrows():
    screens.append([row["Screen ID"],row["Capacity"],row["Theater ID"]])

# for screen in screens:
#     print(screen[0], screen[1], screen[2])
#     cursor.execute('''insert into screens (screen_id, capacity, theater_id)  values (%s, %s, %s)''', (screen[0], screen[1], screen[2]))
# connection.commit()

for item in o:
    if os.path.exists(item + '\\Dataset Movies - Show Timings.csv'):
        file = item + '\\Dataset Movies - Show Timings.csv'

df5 = pd.read_csv(file,encoding='latin-1')

# insert df5 to show_timings table in the database
show_timings=[]
for index,row in  df5.iterrows():
    show_timings.append([row["Show Time ID"],row["Start Time"],row["End Time"]])

for show_timing in show_timings:
    cursor.execute('''insert into show_timings (show_timing_id, start_time, end_time)  values (%s, %s, %s)''', (show_timing[0], show_timing[1], show_timing[2]))
connection.commit()

for item in o:
    if os.path.exists(item + '\\Dataset Movies - Shows.csv'):
        file = item + '\\Dataset Movies - Shows.csv'
    
df6 = pd.read_csv(file,encoding='latin-1')

# insert df6 to shows table in the database
shows=[]
for index,row in  df6.iterrows():
    shows.append([row["Movie ID"],row["Show Time ID"],row["Screen ID"],row["Ticket Price"],row["Ticket Sold"]])

# for show in shows:
#     cursor.execute('''insert into screen_shows (movie_id, show_id, screen_id, ticket_price, ticket_sold)  values (%s, %s, %s, %s, %s)''', (show[0], show[1], show[2], show[3], show[4]))
# connection.commit()
    
# for item in o:
#     if os.path.exists(item + '\\Dataset Movies - Bookings.csv'):
#         file = item + '\\Dataset Movies - Bookings.csv'

# df7 = pd.read_csv(file,encoding='latin-1')

# # insert df7 to bookings table in the database
# bookings=[]
# for index,row in  df7.iterrows():
#     bookings.append([row["booking_id"],row["user_id"],row["screen_shows_id"],row["date"],row["tickets_booked"]])

# for booking in bookings:
#     cursor.execute('''insert into bookings (booking_id,user_id, screen_shows_id,created_at, tickets_booked)  values (%s, %s, %s, %s, %s)''', (booking[0], booking[1], booking[2], booking[3], booking[4]))
# connection.commit()

for item in o:
    if os.path.exists(item + '\\Dataset Movies - Users.csv'):
        file = item + '\\Dataset Movies - Users.csv'

df8 = pd.read_csv(file,encoding='latin-1')

# insert df8 to users table in the database
users=[]
for index,row in  df8.iterrows():
    users.append([row["user_id"],row["name"],row["age"], row["gender"], row["email"]])

for user in users:
    cursor.execute('''insert into user (user_id, name, age, email)  values (%s, %s, %s, %s)''', (user[0], user[1], user[2], user[4]))
    cursor.execute('''insert into user_gender (user_id, gender)  values (%s, %s)''', (user[0], user[3]))

connection.commit()

for item in o:
    if os.path.exists(item + '\\Dataset Movies - Transaction.csv'):
        file = item + '\\Dataset Movies - Transaction.csv'

df9 = pd.read_csv(file,encoding='latin-1')

# insert df9 to transactions table in the database
transactions=[]
for index,row in  df9.iterrows():
    transactions.append([row["id"],row["booking_id"],row["amount"]])

# for transaction in transactions:
#     cursor.execute('''insert into transaction (id, booking_id, amount)  values (%s, %s, %s)''', (transaction[0], transaction[1], transaction[2]))
# connection.commit()

# # # # Load data
df3 = pd.read_csv('indian-movie-theatres.csv',encoding='latin-1')

# # # extract unqiue values from city column
cities = df3['city'].unique()

# # #create map of cities and unique id
city_map = {}
for i, city in enumerate(cities):
    city_map[city] = i+1

# print(city_map)

# # #insert data into city table in the database
for i in range(len(cities)):
    cursor.execute('''insert into city (city_id, name)  values (%s, %s)''', (i+1, cities[i]))
connection.commit()

theatres = df3[['theatre_name', 'no_screens', 'city']].values
# print(theatres)
# #insert data into theatre table in the database
i=0
for theatre in theatres:
    cursor.execute('''insert into theaters (theater_id, name, city_id)  values (%s, %s, %s)''', (i, theatre[0], city_map[theatre[2]]))
    i+=1
connection.commit()



