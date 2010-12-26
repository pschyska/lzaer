global.sys = require "sys"
global.util = require "util"
global.express = require "express"
global.mongoose = require("mongoose").Mongoose
global.Component = require("./counter").Component
global.Counter = require("./counter").Counter
global.SubCounter = require("./counter").SubCounter
global.CoffeeScript = require "coffee-script"
global.ComponentRegistry = require "./component_registry"
global.ClassRegistry = require "./class_registry"
global.Components=
  counter: new Counter("some counter")
  subcounter: new SubCounter("some subclass of counter")

process.on 'uncaughtException', (err) ->
  console.log 'Caught exception: '+err


module.exports.setup = ->

  # database configuration
  global.db = mongoose.connect("mongodb://localhost/lzaer")      

  # express configuration
  app = express.createServer();
  
  app.configure ->
    app.register ".coffee", require("coffeekup")
    app.set "view engine", "coffee"

    app.use express.bodyDecoder()
    app.use express.methodOverride()
    app.use express.cookieDecoder()
    app.use express.session()
    app.use app.router
    app.use express.staticProvider(__dirname + "../../public")
  app.configure "development", ->
    app.use express.errorHandler { dumpExceptions: true, showStack: true }
  app.configure "production", ->
    app.use express.errorHandler()

  # models
  require("./models/user")
  global.User = db.model "User"
  
  # routing
  rootController = require "./controllers/root"
  usersController = require "./controllers/users"
  componentsController = require "./controllers/components"

  app.get "/", rootController.index
  app.get "/components", componentsController.index
  app.get "/components/:componentId/:endpoint/:args", componentsController.endpoint
  app.get "/users", usersController.index
  app.get "/users/create", usersController.create
  app.post "/users/create", usersController.create
    
  app