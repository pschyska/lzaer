global.sys = require 'sys'
global.util = require 'util'
global.http = require 'http'
global.mongoose = require('mongoose').Mongoose

module.exports.setup = ->
  global.db = mongoose.connect("mongodb://localhost/lzaer")
  require("./model/user")
  global.User = db.model 'User'