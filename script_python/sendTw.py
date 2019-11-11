import tweepy
consumer_key = '1laQ5JsXO0VnshtzI2hCEAUai'
consumer_secret = 'fMX0PozHntGJA4dO7mQFYfhzTwXPcrjPvquf0QT2KfX0ur5z4M'
access_token = '1193413476355584000-rXBVVxMzsguHuAgr66u6P8YTt4LkbJ'
access_secret = 'lsKMRgmKHwG8oYElPznV5oa2RZyyMNh9yCXmFjfaHa65v'
auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_secret)
api = tweepy.API(auth)
api.update_status("Libra jajaj poder",lat = "37.776692537", long = "-122.4167751122")
