import mysql.connector
from mysql.connector import Error
import snscrape.modules.twitter as sntwitter
import numpy as np
import pandas as pd
import nltk
nltk.download('vader_lexicon')
from nltk.sentiment.vader import SentimentIntensityAnalyzer
sid=SentimentIntensityAnalyzer()
import snscrape.modules.twitter as sntwitter
import pandas as pd
import datetime
import tweepy
from datetime import datetime

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


#  Authenticate
APP_KEY = "xZ4OSNBnmkE9zN67GUBhPCqSB"
APP_SECRET = "tb57HaWSEzgGUU5pDC43JkRVxZ9f3YbEUOF7AEWFjuiUIQ7GSU"
USER_OAUTH_TOKEN = "1587541442548838400-yzsSqXr7g5vmAhLq5N3GPQapKhd1TH"
USER_OAUTH_TOKEN_SECRET = "g5XvNK7Lg8wmyg6UCXE2QJ3FgpGrdXjKzcn5lKbR9aUe9"
BEARER_TOKEN = "AAAAAAAAAAAAAAAAAAAAABFZiwEAAAAA3mCApctlxrQEXK9%2FiGk6qNpTnXI%3D8ctkG7OyB1Tm7Mj4LSf07I6q5I4qPh1fmt0en0dUF06Z5Kwha1"

auth = tweepy.OAuthHandler(APP_KEY, APP_SECRET)
api = tweepy.API(auth)

#Query to fetch movies released between 2020 and 2020
cursor.execute('SELECT * FROM movie m where m.released_year BETWEEN 2020 AND 2021')
movies = cursor.fetchall()

#Map movie name and movie id
movie_map=  {}
for movie in movies:
    movie_map[movie[1]]=movie[0]

#Function to recommend movie and calculate number of tweets between "2022-11-01" and "2022-11-12"
def calculate_no_of_tweets(result):
    keywords=[]
    for i in result:
        keywords.append(i[1])
        print(i[1])
    print(keywords)
    
    tweets_list2 = []
    tweets_outcome_li={}
    for names in keywords:

        #  Retrieve Tweets
        public_tweets = api.search_tweets(names)

        # Sentiment Analysis on tweets
        for tweet in public_tweets:

            t1=datetime.strptime("2022-11-01","%Y-%m-%d")
            t2=datetime.strptime("2022-11-12","%Y-%m-%d") 
            t1date=t1.date()
            t2date=t2.date()
            checkdate= tweet.created_at.date()
        
            if(checkdate>t1date and checkdate<t2date):
                tweets_list2.append([tweet.id, checkdate, tweet.text, tweet.user.id, tweet.user.screen_name])
            else:
                break        
           
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
            # cursor.execute('''insert into twitter_user (twitter_handle, name,  description, profile_image_url, followers_count, following_count) values (%s, %s, %s, %s, %s, %s)''', (twitter_handle, name, description, profile_image_url, follower_count, following_count))
            # cursor.execute('''insert into twitter_tweets (tweet_id, twitter_handle, twitter_text, profile_image_url, created_at, movie_id) values (%s, %s, %s, %s, %s, %s);''', (tweet_id, twitter_handle, twitter_text, profile_image_url, created_at, 1))
            # cursor.execute('''insert into tweet_url (tweet_id, tweet_url) values (%s, %s)''', (tweet_id, "https://twitter.com/" + twitter_handle + "/status/" + str(tweet_id)))
    
            # if(len(tweet.entities['user_mentions']) > 0):
            #     for mention in tweet.entities['user_mentions']:
            #         target_user = mention['screen_name']
            #         cursor.execute('''insert into tweet_mentions (tweet_id, source_user, target_user) values (%s, %s, %s)''', (tweet_id, twitter_handle, target_user))
            
            # if(len(tweet.entities['hashtags']) > 0):
            #     for tag in tweet.entities['hashtags']:
            #         tag = tag['text']
            #         cursor.execute('''insert into tweet_tags (tweet_id, tag) values (%s, %s)''', (tweet_id, tag))

            # connection.commit()
            # print(cursor.rowcount, "was inserted.")

        tweets_df2 = pd.DataFrame(tweets_list2, columns=['Tweet Id','Tweet Date','Text', 'User','UserName'])
        tweets_df2.to_csv(f"{names}.csv",index=False)
        tweets_df2['scores']=tweets_df2['Text'].apply(lambda text: sid.polarity_scores(text))
        df= pd.read_csv(f"{names}.csv")
        df['scores'] = df['Text'].apply(lambda Text: sid.polarity_scores(Text))
        df['compound']=df['scores'].apply(lambda d:d['compound'])
        df['scores']=df['compound'].apply(lambda score:'Positive' if score >=0 else 'Negative')
        df=df.drop_duplicates()
        df.to_csv("updated.csv")
        score=df['scores'].value_counts().to_dict()
        total_tweets=0
        outcome=""
        postive_review_count= score['Positive']
        tweets_outcome_li[names]={}
        for k,v in score.items():
            total_tweets+=v  
        # print(f'Total Tweets: {total_tweets}')
      
        tweets_outcome_li[names]["Outcome"]=outcome
        tweets_outcome_li[names]["Positive Review Count"]=postive_review_count
        tweets_outcome_li[names]["Total Count"]=total_tweets
    
    dff=pd.DataFrame.from_dict(tweets_outcome_li)
    dff.to_csv("Final_Outcome.csv")

    highest_tweeted_movie={}
    for k,v in tweets_outcome_li.items():
        highest_tweeted_movie[k]=v['Total Count']
    #highest_tweeted_movie=max(highest_tweeted_movie,key=highest_tweeted_movie.get)
    highest_reviewed_movie={}
    for k,v in tweets_outcome_li.items():
        highest_reviewed_movie[k]=(v['Positive Review Count']/v['Total Count'])*100

    return highest_reviewed_movie, highest_tweeted_movie 



if __name__=='__main__':
    calculate_no_of_tweets(movies)
    highest_reviewed_movie,highest_tweeted_movie=calculate_no_of_tweets(movies)

    #Insert tweet count of movies into database
    
    for key in highest_tweeted_movie.keys():
        movie_id = movie_map[key]
        tweets = highest_tweeted_movie[key]
        current_timestamp = datetime.now()
        review_percentage = highest_reviewed_movie[key]
        insert_query="INSERT INTO movie_tweet_count(movie_id,tweet_count,review_percentage) VALUES("+str(movie_id)+","+str(tweets)+","+str(review_percentage)+")"
        print(insert_query)
        cursor.execute(insert_query)
        connection.commit()

        #Query to fetch movie released between 2020 & 2021 with highest number of tweets between "2022-11-01" and "2022-11-12"
        cursor.execute("SELECT m.name FROM movie m WHERE m.movie_id=(SELECT tc.movie_id from movie_tweet_count tc WHERE tc.tweet_count=(SELECT max(mt.tweet_count) from  movie_tweet_count mt))")
        movie_with_highest_tweets=cursor.fetchall()
        print("movie with highest tweet", movie_with_highest_tweets)
        connection.commit()

        #Query to fetch movie released between 2020 & 2021 with highest positive review tweets between "2022-11-01" and "2022-11-12"
        cursor.execute("SELECT m.name FROM movie m WHERE m.movie_id in (SELECT tc.movie_id from movie_tweet_count tc WHERE tc.review_percentage=(SELECT max(mt.review_percentage) from  movie_tweet_count mt))")
        movie_with_highest_positive_review=cursor.fetchall()
        print("movie with highest positive review", movie_with_highest_positive_review)
        connection.commit()

        #Query to find average rating of comedy genre movies
        cursor.execute("SELECT AVG(m.rating) AS Average_Rating FROM Movie m JOIN Movie_Genre mg ON m.movie_id=mg.movie_id JOIN Genre g ON g.genre_id = mg.genre_id and g.genre_id=5")
        avg_rating=cursor.fetchall()
        print("Average Rating", avg_rating)
        connection.commit()

        #Query to find top 10 hit movies by Ajay Devgn
        cursor.execute("SELECT m.name, m.rating, m.movie_id from movie m INNER JOIN movie_stars ma on ma.movie_id = m.movie_id and ma.star_id=(SELECT s.star_id from stars s where s.name='Ajay Devgn') ORDER BY m.rating DESC Limit 10")
        top_movies=cursor.fetchall()
        print("Top 10 Movies of Ajay", top_movies)
        connection.commit()

        #Query to find Top 10 Theaters in Ahmedabad
        cursor.execute("SELECT COUNT(theater_id) AS NoOfTheaters FROM Theaters t where t.city_id=(Select c.city_id from city c where c.name='Ahmedabad')")
        no_of_theaters=cursor.fetchall()
        print("Top 10 Theaters in Ahmedabad", no_of_theaters)
        connection.commit()

        #Query to find  Movie with minimum runtime
        cursor.execute("SELECT N.NAME FROM MOVIE N WHERE N.RUNTIME=(SELECT MIN(M.RUNTIME) FROM MOVIE M)")
        min_runtime=cursor.fetchall()
        print("Movie with minimum runtime", min_runtime)
        connection.commit()



        


    
    





