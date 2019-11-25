import json
from tweepy import Stream
from tweepy import OAuthHandler
from tweepy.streaming import StreamListener

consumer_key = '1laQ5JsXO0VnshtzI2hCEAUai'
consumer_secret = 'fMX0PozHntGJA4dO7mQFYfhzTwXPcrjPvquf0QT2KfX0ur5z4M'
access_token = '1193413476355584000-rXBVVxMzsguHuAgr66u6P8YTt4LkbJ'
access_secret = 'lsKMRgmKHwG8oYElPznV5oa2RZyyMNh9yCXmFjfaHa65v'

file = open("C:\\Users\\pc\\Desktop\\script_python\\Output_dev.csv", "w")
file.write("X,Y,Id,Nombre,Username,Location,\n")

data_list = []
count = 0

class listener(StreamListener):
    def on_data(self, data):
        global count
        #print(data)
        #How many tweets you want to find, could change to time based
        if count <= 1:
            json_data = json.loads(data)
            
            coords = json_data["coordinates"]
            idx = json_data["id_str"]
            username = json_data["user"]["screen_name"]
            if coords is not None:
               print(coords["coordinates"])
               print(json_data["text"])
               lon = coords["coordinates"][0]
               lat = coords["coordinates"][1]
               idx = json_data["id_str"]
               name = json_data["user"]["name"]
               username = json_data["user"]["screen_name"]
               location = json_data["user"]["location"]
               data_list.append(json_data)

               file.write(str(lon) + ",")
               file.write(str(lat) + ",")
               file.write(str(idx) + ",")
               file.write(str((name).encode('utf-8')) + ",")
               file.write(str(username) + ",")
               file.write(str(location) + "\n")
               count += 1
            return True
        else:
            file.close()
            return False

    def on_error(self, status):
        print(status)

auth = OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_secret)
twitterStream = Stream(auth, listener())
twitterStream.filter(track=["teleton"])