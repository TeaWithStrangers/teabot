# Description
#   Store and say bookmarks in a manner akin to botzilla
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
# .$text - responds with the bookmark content
# .bookmark <name> <text> - Bookmarks the content at <name>
# .unmark <name> - unmarks the content at <name>

IGNORE = ['bookmark', 'unmark']

getMark = (data, name) ->
  if data[name] == null
    delete data[name]
  return data[name]

removeMark = (data, name) ->
  if getMark(data, name)
    delete data[name] 
    return 'Deleted '+ name
  else
    return 'Nothing to delete for ' + name

addMark = (data, name, text) ->
  if getMark(data, name)
    return 'Bookmark already exists'
  else
    data[name] = text
    return 'Bookmarked ' + name

allMarks = (data) ->
  col =  []
  for key, val of data
    col.push [key, val]
  col

module.exports = (robot) ->
  robot.brain.on 'loaded', =>
    robot.brain.data.bookmarks ||= {}

  robot.hear /(^|\|)\ ?\.(\S+)/, (msg) ->
    unless msg.match[2] in IGNORE
      msg.send getMark(robot.brain.data.bookmarks, msg.match[2])

  robot.hear /(^\.unmark) (\S+)/, (msg) ->
    msg.send removeMark(robot.brain.data.bookmarks, msg.match[2])

  robot.hear /(^\.bookmark) (\S+) (.+)/, (msg) ->
    msg.send addMark(robot.brain.data.bookmarks, msg.match[2], msg.match[3])

  robot.router.get "/bookmarks", (req, res) ->
    res.write "<table><tr><th>Title</th><th>Text</th></tr>"
    for x in allMarks(robot.brain.data.bookmarks)
      res.write "<tr><td>#{x[0]}</td><td>#{x[1]}</td></tr>"
    res.write "</table>"
    res.end ""
      
