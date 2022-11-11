import tweepy # for twitter api
from textblob import TextBlob # for sentiment analysis
import time
import mysql.connector
from mysql.connector import Error
import re

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

auth = tweepy.OAuthHandler(APP_KEY, APP_SECRET)
api = tweepy.API(auth)

#  Retrieve Tweets
public_tweets = api.search_tweets('brahmastra', count=12)

# Sentiment Analysis on tweets
for tweet in public_tweets:
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
    cursor.execute('''insert into twitter_user (twitter_handle, name,  description, profile_image_url, followers_count, following_count) values (%s, %s, %s, %s, %s, %s)''', (twitter_handle, name, description, profile_image_url, follower_count, following_count))
    cursor.execute('''insert into twitter_tweets (tweet_id, twitter_handle, twitter_text, profile_image_url, created_at, movie_id) values (%s, %s, %s, %s, %s, %s);''', (tweet_id, twitter_handle, twitter_text, profile_image_url, created_at, 1))
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
