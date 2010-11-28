(function() {
  global.sys = require('sys');
  global.util = require('util');
  global.http = require('http');
  global.mongoose = require('mongoose').Mongoose;
  module.exports.setup = function() {
    global.db = mongoose.connect("mongodb://localhost/lzaer");
    require("./model/user");
    return global.User = db.model('User');
  };
}).call(this);
