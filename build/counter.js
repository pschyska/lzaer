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
      ComponentRegistry.register(this);
    }
    Component.prototype.globalId = function() {
      return this.name.replace(/[^0-9A-Za-z_]/, '-').replace(/(\-[a-z])/g, function($1) {
        return $1.toUpperCase().replace('-', '');
      });
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
          this.counter += howMany;
          return function() {
            return this.widget.setTitle("" + $counter);
          };
        }, this)
      };
    };
    Counter.prototype.render = function() {
      var client, widget;
      client = {
        someClientVal: 0,
        someClientFunction: function() {
          return this.someClientVal++;
        },
        someEndpointFunction: function() {
          return this.server.count(1);
        }
      };
      widget = Ext.create({
        xtype: 'panel',
        header: true,
        title: "Some panel",
        items: [
          {
            xtype: 'button',
            text: 'Click me, please',
            handler: function() {
              return client.someEndpointFunction();
            }
          }
        ]
      });
      client.widget = widget;
      return client;
    };
    return Counter;
  }();
}).call(this);
