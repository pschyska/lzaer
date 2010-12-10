(function() {
  var Component, Counter, callServer, counter, endpoints, http, server, sys, util;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  }, __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  sys = require('sys');
  util = require('util');
  callServer = function(strFun, arg) {
    var fun;
    sys.puts("calling " + strFun + " with " + arg);
    fun = eval(strFun);
    return fun(arg);
  };
  endpoints = ['a', 'b', 'c'];
  Component = function() {
    function Component(name, endpoints) {
      this.name = name;
      this.endpoints = endpoints;
      if (!this.name) {
        throw "Need a name";
      }
      this.interface = {};
      sys.puts("I'm a " + this.constructor.name + " called " + name + " and waiting for work!");
    }
    Component.prototype.getClient = function() {
      var clientCode, k, v, _ref;
      clientCode = "var remoter=new window.Remoter();\n";
      _ref = this.endpoints();
      for (k in _ref) {
        v = _ref[k];
        sys.puts(k);
        sys.puts(v);
        clientCode += "remoter.__generateEndpointProxy('" + k + "')";
      }
      clientCode += "\n; \n";
      clientCode += "var Client=";
      clientCode += this.render.toString();
      clientCode += ";\nwindow.client=new Client();\n";
      clientCode += "client.server=remoter; \n";
      return clientCode;
    };
    Component.prototype.render = function() {
      throw "i'm abstract, sorry!";
    };
    return Component;
  }();
  Counter = function() {
    function Counter(name) {
      Counter.__super__.constructor.call(this, name, this.endpoints);
      this.counter = 1;
    }
    __extends(Counter, Component);
    Counter.prototype.privateFunction = function() {
      return "the client can not call me";
    };
    Counter.prototype.endpoints = function() {
      return {
        count: __bind(function(howMany) {
          if (howMany == null) {
            howMany = 1;
          }
          return this.counter += howMany;
        }, this)
      };
    };
    Counter.prototype.render = function() {
      return {
        someClientVal: 0,
        someClientFunction: function() {
          return this.someClientVal++;
        },
        someEndpointFunction: function() {
          return this.server.count();
        }
      };
    };
    return Counter;
  }();
  counter = new Counter('some counter');
  http = require('http');
  server = http.createServer(function(req, res) {
    res.writeHead(200, {
      'Content-Type': 'application/json'
    });
    return res.end(counter.getClient());
  });
  server.listen(8124, "127.0.0.1");
}).call(this);
