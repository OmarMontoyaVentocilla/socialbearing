import tweepy
consumer_key = '1laQ5JsXO0VnshtzI2hCEAUai'
consumer_secret = 'fMX0PozHntGJA4dO7mQFYfhzTwXPcrjPvquf0QT2KfX0ur5z4M'
access_token = '1193413476355584000-rXBVVxMzsguHuAgr66u6P8YTt4LkbJ'
access_secret = 'lsKMRgmKHwG8oYElPznV5oa2RZyyMNh9yCXmFjfaHa65v'
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_secret)
api = tweepy.API(auth,wait_on_rate_limit=True)
search_words = "teleton"
geocode="37.776692537,-122.4167751122,50km"
date_since = "2016-11-16"
tweets = tweepy.Cursor(api.search,q=search_words,lang="es",geocode=geocode,since=date_since,tweet_mode='extended').items(200)
for tweet in tweets:
    for i in tweet.user:
        print(i.screen_name)

    