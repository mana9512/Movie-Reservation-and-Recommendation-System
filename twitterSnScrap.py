import mysql.connector
from mysql.connector import Error
import snscrape.modules.twitter as sntwitter
# import json
# import numpy as np
# import pandas as pd
# import requests
# from requests_oauthlib import OAuth1
# from datetime import datetime

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

#
# Creating list to append tweet data to
#
tweets_list2 = []

# Using TwitterSearchScraper to scrape data and append tweets to list
for i,tweet in enumerate(sntwitter.TwitterSearchScraper('avengers end game').get_items()):
    if i>5:
        break
    tweets_list2.append([tweet.id, tweet.date, tweet.content, tweet.user, tweet.user.username])
    
print(type(tweets_list2))

for i in range(len(tweets_list2)):
    tweet_id = tweets_list2[i][0]
    created_at = tweets_list2[i][1]
    twitter_text = tweets_list2[i][2]
    username = tweets_list2[i][4]
    name = tweets_list2[i][3].displayname
    userId = tweets_list2[i][3].id
    follower_count = tweets_list2[i][3].followersCount
    following_count = tweets_list2[i][3].friendsCount
    twitter_handle = tweets_list2[i][3].username
    profile_image_url = tweets_list2[i][3].profileImageUrl
    description = tweets_list2[i][3].description
    tweet_url = tweets_list2[i][3].url
    userCreated_at = tweets_list2[i][3].created

    print("------here------", "type: ", type(tweet_id), "tweet id: ", tweet_id, "created_at: ", created_at, "twitter_text: ", twitter_text, "username: ", username, "name: ", name, "userId: ", userId, "follower_count: ", follower_count, "following_count: ", following_count, "twitter_handle: ", twitter_handle, "profile_image_url: ", profile_image_url, "description: ", description)
    # break;
    cursor.execute('''insert into twitter_user (twitter_handle, name,  description, profile_image_url, followers_count, following_count) values (%s, %s, %s, %s, %s, %s)''', (twitter_handle, name, description, profile_image_url, follower_count, following_count))
    cursor.execute('''insert into twitter_tweets (tweet_id, twitter_handle, twitter_text, profile_image_url, created_at, movie_id) values (%s, %s, %s, %s, %s, %s);''', (tweet_id, twitter_handle, twitter_text, profile_image_url, created_at, 1))
    cursor.execute("insert into tweet_url (tweet_id, tweet_url) values (%s, %s)", (tweet_id, tweet_url))
    connection.commit()

    print(cursor.rowcount, "was inserted.")
