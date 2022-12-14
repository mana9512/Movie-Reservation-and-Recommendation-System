import tweepy # for twitter api
from textblob import TextBlob # for sentiment analysis
import time
import mysql.connector
from mysql.connector import Error
import re
import requests
from requests_oauthlib import OAuth1
import json
import datetime
from datetime import datetime, timedelta

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
connection = create_connection("localhost", "root", "root", "mtr")
cursor = connection.cursor()

#  Authentication
APP_KEY = "xZ4OSNBnmkE9zN67GUBhPCqSB"
APP_SECRET = "tb57HaWSEzgGUU5pDC43JkRVxZ9f3YbEUOF7AEWFjuiUIQ7GSU"
USER_OAUTH_TOKEN = "1587541442548838400-yzsSqXr7g5vmAhLq5N3GPQapKhd1TH"
USER_OAUTH_TOKEN_SECRET = "g5XvNK7Lg8wmyg6UCXE2QJ3FgpGrdXjKzcn5lKbR9aUe9"
BEARER_TOKEN = "AAAAAAAAAAAAAAAAAAAAABFZiwEAAAAA3mCApctlxrQEXK9%2FiGk6qNpTnXI%3D8ctkG7OyB1Tm7Mj4LSf07I6q5I4qPh1fmt0en0dUF06Z5Kwha1"
authApi = OAuth1(APP_KEY, APP_SECRET,
              USER_OAUTH_TOKEN, USER_OAUTH_TOKEN_SECRET)

auth = tweepy.OAuthHandler(APP_KEY, APP_SECRET)
api = tweepy.API(auth)

#  Retrieve Tweets
movieInput = input("Enter movie name: ")
public_tweets = api.search_tweets('black', count=10)
cursor.execute('SELECT * FROM movie m where m.released_year BETWEEN 2020 AND 2021')
movies = cursor.fetchall()

# Map movie name and movie id
movie_map=  {}
for movie in movies:
    movie_map[movie[1]]=movie[0]

keywords=[]
for i in movies:
    keywords.append(i[1])
    print(i[1])
print(keywords)

for names in keywords:

    public_tweets = api.search_tweets(names)
    movie_id = movie_map[names]
    print("------------------------------", public_tweets)

    # Sentiment Analysis on tweets
    for tweet in public_tweets:
        # Using tweets only from 2022-11-01 to 2022-11-12
        t1=datetime.strptime("2022-11-01","%Y-%m-%d")
        t2=datetime.strptime("2022-11-12","%Y-%m-%d") 
        t1date=t1.date()
        t2date=t2.date()
        checkdate= tweet.created_at.date()
    
        if(checkdate<t1date and checkdate>t2date):
            break
        else:
            # print(tweet)
            analysis = TextBlob(tweet.text)
            print(analysis.sentiment)
            sentiment = analysis.sentiment.polarity
            if sentiment > 0:
                print('positive')
            elif sentiment == 0:
                print('neutral')
            else:
                print('negative')

            tweet_id = tweet.id
            created_at = tweet.created_at
            twitter_text = tweet.text
            username = tweet.user.screen_name
            name = tweet.user.name
            userId = tweet.user.id
            follower_count = tweet.user.followers_count
            following_count = tweet.user.friends_count
            twitter_handle = tweet.user.screen_name
            profile_image_url = tweet.user.profile_image_url_https
            description = tweet.user.description
            userCreated_at = tweet.user.created_at
            
            # print("------here------", "type: ", type(tweet_id), "tweet id: ", tweet_id, "created_at: ", created_at, "twitter_text: ", twitter_text, "username: ", username, "name: ", name, "userId: ", userId, "follower_count: ", follower_count, "following_count: ", following_count, "twitter_handle: ", twitter_handle, "profile_image_url: ", profile_image_url, "description: ", description)
            # break;
            cursor.execute('''select * from twitter_tweets WHERE tweet_id = %s''', (tweet_id, ))
            findTweet = cursor.fetchone()
            print("findTweet----------", findTweet)
            if findTweet:
                print("Tweet already exists")
            else:
                cursor.execute('''select * from twitter_user where twitter_handle = %s''', (twitter_handle, ))
                findUser = cursor.fetchone()
                print("findUser----------", findUser)
                if findUser:
                    print("User already exists")
                else:
                    cursor.execute('''insert into twitter_user (twitter_handle, name,  description, profile_image_url, followers_count, following_count, created_at) values (%s, %s, %s, %s, %s, %s, %s)''', (twitter_handle, name, description, profile_image_url, follower_count, following_count, userCreated_at))
                
                
                tweets = api.get_status(tweet_id)
                favorite_count = tweets.favorite_count
                retweet_count = tweets.retweet_count

                # likes_count = json.dumps(tweet['retweeted_status']['favorite_count']._json)
                # retweet_count = tweet.retweet_count
                cursor.execute('''insert into twitter_tweets (tweet_id, twitter_text, profile_image_url, created_at, likes, retweet, sentiment) values (%s, %s, %s, %s, %s, %s, %s);''', (tweet_id, twitter_text, profile_image_url, created_at, favorite_count, retweet_count, sentiment))
                cursor.execute('''insert into twitter_tweet_movie (tweet_id, movie_id) values (%s, %s);''', (tweet_id, movie_id))
                cursor.execute('''insert into twitter_tweet_handle (tweet_id, twitter_handle) values (%s, %s);''', (tweet_id, twitter_handle))
                
                cursor.execute('''insert into tweet_url (tweet_id, tweet_url) values (%s, %s)''', (tweet_id, "https://twitter.com/" + twitter_handle + "/status/" + str(tweet_id)))
                
                if(len(tweet.entities['user_mentions']) > 0):
                    for mention in tweet.entities['user_mentions']:
                        target_user = mention['screen_name']
                        cursor.execute('''insert into tweet_mentions (tweet_id, source_user, target_user) values (%s, %s, %s)''', (tweet_id, twitter_handle, target_user))
                
                if(len(tweet.entities['hashtags']) > 0):
                    for tag in tweet.entities['hashtags']:
                        tag = tag['text']
                        cursor.execute('''insert into tweet_tags (tweet_id, tag) values (%s, %s)''', (tweet_id, tag))

                connection.commit()
                print(cursor.rowcount, "was inserted.")

# 
# Common Twitter Queries
# 
print("-----Common Twitter Queries-----")
# Q1. What user posted this tweet?
print("Q1. What user posted this tweet?")
anyTweet = input("Enter tweet id: ")
if(len(anyTweet) == 0):
    print("Please enter a valid user handle")
else:
    qone = cursor.execute("SELECT u.name, t.twitter_text FROM twitter_user as u INNER JOIN twitter_tweet_handle tt ON tt.twitter_handle = u.twitter_handle INNER JOIN twitter_tweets as t ON tt.tweet_id = t.tweet_id WHERE t.tweet_id = %s", (anyTweet, ))
    qone = cursor.fetchone()
    print("Ans1: ", qone)

    # Q2. When did the user post this tweet?
    print("Q2. When did the user post this tweet?")
    qtwo = cursor.execute("SELECT u.name, t.twitter_text, t.created_at FROM twitter_user as u INNER JOIN twitter_tweet_handle tt ON tt.twitter_handle = u.twitter_handle INNER JOIN twitter_tweets as t ON tt.tweet_id = t.tweet_id WHERE t.tweet_id = %s", (anyTweet, ))
    qtwo = cursor.fetchone()
    print("Ans2: ", qtwo)

# Q3. What tweets have this user posted in the past 24 hours?
print("Q3. What tweets have this user posted in the past 24 hours?")
anyUser = input("Enter user handle: ")
if(len(anyUser) == 0):
    print("Please enter a valid user handle")
else:
    now = datetime.now()
    prev = now + timedelta(days=-1)
    now = datetime.strftime(now, "%Y-%m-%d %H:%M:%S")
    prev = datetime.strftime(prev, "%Y-%m-%d %H:%M:%S")

    fetchThree = api.user_timeline(screen_name=anyUser, count=100)
    for tweet in fetchThree:
        created_at_date = datetime.strftime(tweet.created_at, "%Y-%m-%d %H:%M:%S")
        
        cursor.execute('''select * from twitter_tweets WHERE tweet_id = %s''', (tweet.id, ))
        findThisTweet = cursor.fetchone()
        print("findThisTweet----------", findThisTweet)
        if findThisTweet:
            print("Tweet already exists")
        else:
            if(created_at_date > prev and created_at_date < now):
                print("tweet in 24 hours")
                cursor.execute('''insert into twitter_tweets (tweet_id, twitter_handle, twitter_text, profile_image_url, created_at, movie_id, likes, retweet, sentiment) values (%s, %s, %s, %s, %s, %s, %s, %s, %s);''', (tweet_id, twitter_handle, twitter_text, profile_image_url, created_at, movie_id, favorite_count, retweet_count, sentiment))
                cursor.execute('''insert into twitter_tweet_movie (tweet_id, movie_id) values (%s, %s);''', (tweet_id, movie_id))
                cursor.execute('''insert into twitter_tweet_handle (tweet_id, twitter_handle) values (%s, %s);''', (tweet_id, twitter_handle))
                
                connection.commit()
                print(cursor.rowcount, "was inserted.")
            else:
                print("tweet not in 24 hours")
    qthree = cursor.execute("SELECT u.name, t.twitter_text, t.created_at FROM twitter_user as u INNER JOIN twitter_tweet_handle tt ON tt.twitter_handle = u.twitter_handle INNER JOIN twitter_tweets as t ON tt.tweet_id = t.tweet_id WHERE u.twitter_handle = %s and t.created_at BETWEEN %s AND %s", (anyUser, prev, now))
    qthree = cursor.fetchall()
    print("Ans3: ", qthree)

    # Q4. How many tweets have this user posted in the past 24 hours?
    print("Q4. How many tweets have this user posted in the past 24 hours?")
    qfour = cursor.execute("SELECT u.name, count(t.twitter_text), t.created_at FROM twitter_user as u INNER JOIN twitter_tweet_handle tt ON tt.twitter_handle = u.twitter_handle INNER JOIN twitter_tweets as t ON tt.tweet_id = t.tweet_id WHERE u.twitter_handle = %s and t.created_at BETWEEN %s AND %s", (anyUser, prev, now))
    qfour = cursor.fetchall()
    print("Ans4: ", qfour)

    # Q5. When did this user join Twitter?
    print("Q5. When did this user join Twitter?")
    qfive = cursor.execute("SELECT u.twitter_handle, u.created_at FROM twitter_user as u where u.twitter_handle = %s", (anyUser, ))
    qfive = cursor.fetchall()
    print("Ans5: ", qfive)

# Q6. What keywords/ hashtags are popular?
print("Q6. What keywords/ hashtags are popular?")
qsix = cursor.execute("SELECT t.tag, count(t.tag) FROM tweet_tags as t GROUP BY t.tag ORDER BY count(t.tag) DESC LIMIT 10")
qsix = cursor.fetchall()
print("Ans6: ", qsix)

# Q7. What tweets are popular?
print("Q7. What tweets are popular?")
qseven = cursor.execute("SELECT t.twitter_text, t.likes, t.retweet FROM twitter_tweets as t ORDER BY t.retweet DESC LIMIT 10")
qseven = cursor.fetchall()
print("Ans7: ", qseven)

# 
# Manashree's Queries
# 
print("-----Manashree's Queries-----")
# Q1. What is the average rating of comedy genre movies?
print("Q1. What is the average rating of comedy genre movies?")
mq1 = "SELECT AVG(m.rating) AS Average_Rating FROM Movie m JOIN Movie_Genre mg ON m.movie_id=mg.movie_id JOIN Genre g ON g.genre_id = mg.genre_id and g.genre = 'comedy'"
cursor.execute(mq1)
mq1 = cursor.fetchall()
print("Ans1: ", mq1)

# Q2. What are the top 10 hit movies by Ajay Devgn?
print("Q2. What are the top 10 hit movies by Ajay Devgn?")
mq2 = "SELECT m.name, m.rating, m.movie_id from movie m INNER JOIN movie_stars ma on ma.movie_id = m.movie_id and ma.star_id=(SELECT s.star_id from stars s where s.name='Ajay Devgn') ORDER BY m.rating DESC Limit 10"
cursor.execute(mq2)
mq2 = cursor.fetchall()
print("Ans2: ", mq2)

# Q3. What is the total number of theaters in Ahmedabad?
print("Q3. What is the total number of theaters in Ahmedabad?")
mq3 = "SELECT COUNT(theater_id) AS NoOfTheaters FROM Theaters t where t.city_id=(Select c.city_id from city c where c.name='Ahmedabad')"
cursor.execute(mq3)
mq3 = cursor.fetchall()
print("Ans3: ", mq3)

# Q4. Name the movies with minimum runtime.
print("Q4. Name the movies with minimum runtime.")
mq4 = "SELECT N.NAME FROM MOVIE N WHERE N.RUNTIME=(SELECT MIN(M.RUNTIME) FROM MOVIE M)"
cursor.execute(mq4)
mq4 = cursor.fetchall()
print("Ans4: ", mq4)

# Q5. List the movie with the least number of tweets between 2022-11-1 between 2022-11-12.
print("Q5. List the movie with the least number of tweets between 2022-11-1 between 2022-11-12.")
mq5 = "SELECT m.name, COUNT(tm.movie_id) AS count FROM movie m INNER JOIN twitter_tweet_movie tm ON tm.movie_id = m.movie_id INNER JOIN twitter_tweets t ON t.tweet_id = tm.tweet_id GROUP BY m.name ORDER BY count LIMIT 1"
cursor.execute(mq5)
mq5 = cursor.fetchall()
print("Ans5: ", mq5)

# Q6. List actors of movies with highest positive reviews fetched from tweets between 2022-11-1 between 2022-11-12.
print("Q6. List actors of movies with highest positive reviews fetched from tweets between 2022-11-1 between 2022-11-12.")
mq6 = "Select s.name from stars s inner join movie_stars ms on s.star_id=ms.star_id and ms.movie_id=(Select m.movie_id  from movie m INNER JOIN twitter_tweet_movie tm ON tm.movie_id = m.movie_id INNER JOIN twitter_tweets t ON t.tweet_id = tm.tweet_id group by m.name order by sum(t.sentiment) limit 1)"
cursor.execute(mq6)
mq6 = cursor.fetchall()
print("Ans6: ", mq6)

# 
# Anshul's Queries
# 
print("-----Anshul's Queries-----")
# Q1. Top 5 actors with maximum number of movie releases in the year 2016?
print("Q1. Top 5 actors with maximum number of movie releases in the year 2016?")
aq1 = "SELECT count(stars.star_id) as top_actors ,stars.name, movie.released_year FROM stars INNER JOIN movie_stars ON movie_stars.star_id = stars.star_id INNER JOIN movie ON movie.movie_id = movie_stars.movie_id and movie.released_year = 2016 GROUP BY stars.star_id ORDER BY top_actors DESC LIMIT 5"
cursor.execute(aq1)
aq1 = cursor.fetchall()
print("Ans1: ", aq1)

# Q2. Total number of screens in theaters in the city of Mumbai?
print("Q2. Total number of screens in theaters in the city of Mumbai?")
aq2 = "SELECT c.name, COUNT(s.screen_id) FROM theaters AS t INNER JOIN city AS c ON t.city_id = c.city_id INNER JOIN screens AS s ON s.theater_id = t.theater_id AND c.name = 'Mumbai'"
cursor.execute(aq2)
aq2 = cursor.fetchall()
print("Ans2: ", aq2)

# Q3. List the actors whose movies were released between 2018 and 2021.
print("Q3. List the actors whose movies were released between 2018 and 2021.")
aq3 = "SELECT s.name, m.name, m.released_year FROM movie AS m INNER JOIN movie_stars AS ms ON m.movie_id = ms.movie_id AND m.released_year BETWEEN 2018 AND 2021 INNER JOIN stars AS s ON s.star_id = ms.star_id"
cursor.execute(aq3)
aq3 = cursor.fetchall()
print("Ans3: ", aq3)

# Q4. List the actors of movies with highest number of retweets between 2022-11-01 and 2022-11-12.
print("Q4. List the actors of movies with highest number of retweets between 2022-11-01 and 2022-11-12.")
aq4 = "SELECT s.name FROM stars AS s INNER JOIN movie_stars AS ms ON s.star_id = ms.star_id AND ms.movie_id = (SELECT m.movie_id FROM movie AS m INNER JOIN twitter_tweet_movie AS tm ON tm.movie_id = m.movie_id INNER JOIN twitter_tweets AS t ON tm.tweet_id = t.tweet_id ORDER BY t.retweet DESC LIMIT 1)"
cursor.execute(aq4)
aq4 = cursor.fetchall()
print("Ans4: ", aq4)

# Q5. List the movie with most negative reviews fetched from tweets between 2022-11-1 between 2022-11-12.
print("Q5. List the movie with most negative reviews fetched from tweets between 2022-11-1 between 2022-11-12.")
aq5 = "SELECT m.name, SUM(t.sentiment) AS sentiment FROM movie AS m INNER JOIN twitter_tweet_movie AS tm ON tm.movie_id = m.movie_id INNER JOIN twitter_tweets AS t ON tm.tweet_id = t.tweet_id GROUP BY m.name ORDER BY SUM(sentiment) ASC LIMIT 1"
cursor.execute(aq5)
aq5 = cursor.fetchall()
print("Ans5: ", aq5)

# Q6. List movies with most and distinct tweet mentions fetched from tweets between 2022-11-1 between 2022-11-12.
print("Q6. List movies with most and distinct tweet mentions fetched from tweets between 2022-11-1 between 2022-11-12.")
aq6 = "SELECT m.name, COUNT(DISTINCT tt.target_user) as all_mentions FROM movie AS m INNER JOIN twitter_tweet_movie AS tm ON tm.movie_id = m.movie_id INNER JOIN twitter_tweets AS t ON tm.tweet_id = t.tweet_id INNER JOIN tweet_mentions AS tt ON t.tweet_id = tt.tweet_id GROUP BY m.name ORDER BY all_mentions DESC LIMIT 1"
cursor.execute(aq6)
aq6 = cursor.fetchall()
print("Ans6: ", aq6)

# 
# Soham's Queries
# 
print("-----Soham's Queries-----")
# Q1. Best rated movie between 2015 to 2016.
print("Q1. Best rated movie between 2015 to 2016.")
sq1 = "SELECT name, max(rating) FROM movie WHERE released_year BETWEEN 2015 AND 2016 ORDER BY name ASC"
cursor.execute(sq1)
sq1 = cursor.fetchall()
print("Ans1: ", sq1)

# Q2. Which theater had the highest sales?
print("Q2. Which theater had the highest sales?")
sq2 = "SELECT t.name, MAX(s.ticket_price*b.tickets_booked) FROM theaters t INNER JOIN screens sc ON t.theater_id = sc.theater_id INNER JOIN screen_shows s ON sc.screen_id = s.screen_id INNER JOIN bookings b ON b.screen_shows_id = s.id"
cursor.execute(sq2)
sq2 = cursor.fetchall()
print("Ans2: ", sq2)

# Q3. Year with least number of movies
print("Q3. Year with least number of movies")
sq3 = "SELECT released_year, COUNT(movie_ID) as movie_count FROM movie GROUP BY released_year ORDER BY movie_count ASC LIMIT 1"
cursor.execute(sq3)
sq3 = cursor.fetchall()
print("Ans3: ", sq3)

# Q4. List movies with most tweet tags fetched from tweets between 2022-11-1 between 2022-11-12.
print("Q4. List movies with most tweet tags fetched from tweets between 2022-11-1 between 2022-11-12.")
sq4 = "SELECT m.name, COUNT(tt.tag) FROM movie AS m INNER JOIN twitter_tweet_movie AS tm ON tm.movie_id = m.movie_id INNER JOIN twitter_tweets AS t ON tm.tweet_id = t.tweet_id INNER JOIN tweet_tags tt ON t.tweet_id = tt.tweet_id GROUP BY m.name ORDER BY COUNT(tt.tag) DESC LIMIT 1"
cursor.execute(sq4)
sq4 = cursor.fetchall()
print("Ans4: ", sq4)

# Q5.  List movies with most tweets fetched from tweets between 2022-11-1 between 2022-11-12.
print("Q5.  List movies with most tweets fetched from tweets between 2022-11-1 between 2022-11-12.")
sq5 = "SELECT m.name, COUNT(t.tweet_id)AS tweet_count FROM movie m INNER JOIN twitter_tweet_movie AS tm ON tm.movie_id = m.movie_id INNER JOIN twitter_tweets AS t ON tm.tweet_id = t.tweet_id GROUP BY tm.movie_id ORDER BY tweet_count DESC LIMIT 1"
cursor.execute(sq5)
sq5 = cursor.fetchall()
print("Ans5: ", sq5)