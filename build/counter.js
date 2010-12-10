(function() {
  var Component, Counter;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  }, __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };
  module.exports.Component = Component = function() {
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
  module.exports.Counter = Counter = function() {
    __extends(Counter, Component);
    function Counter(name) {
      Counter.__super__.constructor.call(this, name, this.endpoints);
      this.counter = 0;
    }
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
}).call(this);
