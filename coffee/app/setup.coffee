global.sys = require 'sys'
global.util = require 'util'
global.express = require 'express'
global.mongoose = require('mongoose').Mongoose

module.exports.setup = ->

  # database configuration
  global.db = mongoose.connect("mongodb://localhost/lzaer")      

  # express configuration
  app = express.createServer();
  
  app.configure ->
    app.set 'views', __dirname + '/views'
    app.set 'view engine', 'jade'
    app.use express.bodyDecoder()
    app.use express.methodOverride()
    app.use express.cookieDecoder()
    app.use express.session()
    app.use app.router
    app.use express.staticProvider(__dirname + '../../public')
  app.configure 'development', ->
    app.use express.errorHandler { dumpExceptions: true, showStack: true }
  app.configure 'production', ->
    app.use express.errorHandler()

  # models
  require("./models/user")
  global.User = db.model 'User'
  
  # routing
  rootController = require './controllers/root'

  app.get "/", rootController.index;
  # o.app.get("/users/:id", users_controller.show );
  # o.app.post("/users", users_controller.create );
  # o.app.put("/users/update/:id", users_controller.update );  
    
  app