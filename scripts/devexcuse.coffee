# Description:
#   Dev excuses scraper. Gets you excused when shit hits the fan.
#   From http://developerexcuses.com/
#
# Dependencies:
#   "cheerio": "~0.12.0"
#
# Configuration:
#   None
#
# Commands:
#   hubot excuse me - prints an excuse
#
# Notes:
#
# Author:
#   plukevdh

cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.respond /excuse me/i, (msg) ->
    robot.http("http://developerexcuses.com/")
      .get() (err, res, body) ->
        $ = cheerio.load(body)

        msg.send $('.wrapper a').text()
