mongoose = require 'mongoose'.Mongoose

module.exports.setup = ->
  global.db = mongoose.connect("mongodb://localhost/lzaer")
  mongoose.model 'User', require("./model/user").definition()
  global.User = db.model 'User'