# Description
#   Responds to requests for Lunch by pinging the channel
#
# Dependencies:
#   None
#
# Configuration:
#   None

GIFS = [
  'http://media.tumblr.com/tumblr_m819gkEl2R1qao252.gif',
  'https://dl.dropboxusercontent.com/u/9061771/GIF/Patrick%20Spongebob%20Eating%20Lunch.gif',
  'https://dl.dropboxusercontent.com/u/9061771/GIF/Emma%20Stone%20Lunch%20Yum%20Eating.gif',
  'https://dl.dropboxusercontent.com/u/9061771/GIF/Lunch%20Ramen%20Slurping.gif'
]

gifMe = () ->
 GIFS[Math.floor(Math.random() * GIFS.length)]

module.exports = (robot) ->

  robot.hear /((lunch)[!.?]+)/i, (msg) ->
    resp = ""
    if msg.match[0].slice(-1) is '!'
      resp += "@channel: "
    msg.send resp + gifMe()

  robot.hear /((burrito monday)[!.?]+)/i, (msg) ->
    resp = ""
    if msg.match[0].slice(-1) is '!'
      resp += "@channel: "
    msg.send resp + "https://dl.dropboxusercontent.com/u/9061771/GIF/burrito_monday.gif"
