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
connection = create_connection("localhost", "root", "root", "movie_ticket_reservation")
cursor = connection.cursor()

#  Authenticate
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
# movieInput = input("Enter movie name: ")
# public_tweets = api.search_tweets('black', count=10)
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
                cursor.execute('''insert into twitter_tweets (tweet_id, twitter_handle, twitter_text, profile_image_url, created_at, movie_id, likes, retweet, sentiment) values (%s, %s, %s, %s, %s, %s, %s, %s, %s);''', (tweet_id, twitter_handle, twitter_text, profile_image_url, created_at, movie_id, favorite_count, retweet_count, sentiment))
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


# Q1    What user posted this tweet?
anyTweet = input("Enter tweet id: ")
qone = cursor.execute("SELECT u.name, t.twitter_text FROM twitter_user as u INNER JOIN twitter_tweets as t ON u.twitter_handle = t.twitter_handle WHERE t.tweet_id = %s", (anyTweet, ))
qone = cursor.fetchone()
print("Q1: ", qone)

# Q2    When did the user post this tweet?
qtwo = cursor.execute("SELECT u.name, t.twitter_text, t.created_at FROM twitter_user as u INNER JOIN twitter_tweets as t ON u.twitter_handle = t.twitter_handle WHERE t.tweet_id = %s", (anyTweet, ))
qtwo = cursor.fetchone()
print("Q2: ", qtwo)

# Q3    What tweets have this user posted in the past 24 hours?
anyUser = input("Enter user handle: ")
now = datetime.today().now()
prev = now-timedelta(days=1)
now = datetime.strptime(str(now), "%Y-%m-%d %H:%M:%S")
prev = datetime.strptime(str(prev), "%Y-%m-%d %H:%M:%S")

print("time------", type(prev), now)
fetchThree = api.user_timeline(screen_name=anyUser, count=100)
for tweet in fetchThree:
    print(tweet.created_at)
    print(tweet.created_at.date())
    if(tweet.created_at > prev and tweet.created_at < now):
        print("tweet in 24 hours")
        cursor.execute("insert into twitter_tweets (tweet_id, twitter_handle, twitter_text, profile_image_url, created_at, likes, retweet) values (%s, %s, %s, %s, %s, %s, %s);", (tweet.id, anyUser, tweet.text, tweet.user.profile_image_url_https, tweet.created_at, tweet.favorite_count, tweet.retweet_count))
        cursor.commit()
        print("---commited---")
    else:
        print("tweet not in 24 hours")
qthree = cursor.execute("SELECT u.name, t.twitter_text, t.created_at FROM twitter_user as u INNER JOIN twitter_tweets as t ON u.twitter_handle = t.twitter_handle WHERE u.twitter_handle = %s and t.created_at BETWEEN %s AND %s", (anyUser, prev, now))
qthree = cursor.fetchall()
print("Q3: ", qthree)

# Q4    How many tweets have this user posted in the past 24 hours?
qfour = cursor.execute("SELECT u.name, count(t.twitter_text), t.created_at FROM twitter_user as u INNER JOIN twitter_tweets as t ON u.twitter_handle = t.twitter_handle WHERE u.twitter_handle = %s and t.created_at BETWEEN %s AND %s", (anyUser, prev, now))
qfour = cursor.fetchall()
print("Q4: ", qfour)

# Q5    When did this user join Twitter?
qfive = cursor.execute("SELECT u.twitter_handle, u.created_at FROM twitter_user as u where u.twitter_handle = %s", (anyUser, ))
qfive = cursor.fetchall()
print("Q5: ", qfive)

# Q6    What keywords/ hashtags are popular?
qsix = cursor.execute("SELECT t.tag, count(t.tag) FROM tweet_tags as t GROUP BY t.tag ORDER BY count(t.tag) DESC LIMIT 10")
qsix = cursor.fetchall()
print("Q6: ", qsix)

# Q7    What tweets are popular?
qseven = cursor.execute("SELECT t.twitter_text, t.likes, t.retweet FROM twitter_tweets as t ORDER BY t.retweet DESC LIMIT 10")
qseven = cursor.fetchall()
print("Q7: ", qseven)