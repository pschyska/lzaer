(function() {
  global.sys = require('sys');
  global.util = require('util');
  global.express = require('express');
  global.mongoose = require('mongoose').Mongoose;
  global.Counter = require('./counter').Counter;
  global.CoffeeScript = require("coffee-script");
  global.ComponentRegistry = require('./component_registry');
  global.ClassRegistry = require('./class_registry');
  global.Components = {
    counter: new Counter('some counter')
  };
  module.exports.setup = function() {
    var app, componentsController, rootController, usersController;
    global.db = mongoose.connect("mongodb://localhost/lzaer");
    app = express.createServer();
    app.configure(function() {
      app.register('.coffee', require('coffeekup'));
      app.set('view engine', 'coffee');
      app.use(express.bodyDecoder());
      app.use(express.methodOverride());
      app.use(express.cookieDecoder());
      app.use(express.session());
      app.use(app.router);
      return app.use(express.staticProvider(__dirname + '../../public'));
    });
    app.configure('development', function() {
      return app.use(express.errorHandler({
        dumpExceptions: true,
        showStack: true
      }));
    });
    app.configure('production', function() {
      return app.use(express.errorHandler());
    });
    require("./models/user");
    global.User = db.model('User');
    rootController = require('./controllers/root');
    usersController = require('./controllers/users');
    componentsController = require('./controllers/components');
    app.get("/", rootController.index);
    app.get("/components", componentsController.index);
    app.get("/components/:componentId/:endpoint/:args", componentsController.endpoint);
    app.get('/users', usersController.index);
    app.get('/users/create', usersController.create);
    app.post('/users/create', usersController.create);
    return app;
  };
}).call(this);
