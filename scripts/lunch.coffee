# Description
#   Responds to requests for Lunch by pinging the channel
#
# Dependencies:
#   None
#
# Configuration:
#   None

GIFS = [
  'http://media.tumblr.com/tumblr_m819gkEl2R1qao252.gif'
]

gifMe = () ->
 GIFS[Math.floor(Math.random() * GIFS.length)]

module.exports = (robot) ->

  robot.hear /lunch?/i, (msg) ->
    msg.send gifMe()

  robot.hear /lunch?!/i, (msg) ->
    msg.send "@channel: " + gifMe()
