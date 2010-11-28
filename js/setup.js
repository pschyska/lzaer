(function() {
  var mongoose;
  mongoose = require('mongoose'.Mongoose);
  module.exports.setup = function() {
    global.db = mongoose.connect("mongodb://localhost/lzaer");
    mongoose.model('User', require("./model/user").definition());
    return global.User = db.model('User');
  };
}).call(this);
