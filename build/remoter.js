(function() {
  var Remoter;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __slice = Array.prototype.slice;
  Remoter = function() {
    function Remoter() {
      this.__generateEndpointProxy = __bind(this.__generateEndpointProxy, this);;
    }
    Remoter.prototype.__callServer = function(client, componentId, endpoint, jsonArg) {
      return Ext.Ajax.request({
        url: "/components/" + componentId + "/" + endpoint + "/" + jsonArg,
        success: function(response, opts) {
          return Function(response.responseText).apply(client);
        },
        failure: function(response, opts) {
          return alert("Oh noe, something bad called " + response.status + " happened");
        }
      });
    };
    Remoter.prototype.__generateEndpointProxy = function(client, componentId, endpoint) {
      this[componentId] = {};
      return this[componentId][endpoint] = __bind(function() {
        var args;
        args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        if (args.length > 0) {
          return this.__callServer(client, componentId, endpoint, JSON.stringify(args));
        } else {
          return this.__callServer(client, componentId, endpoint, JSON.stringify(args));
        }
      }, this);
    };
    Ext.ns('Ekzten', 'Ekzten.classes');
    Ekzten.classes.Remoter = Remoter;
    Ekzten.remoter = new Ekzten.classes.Remoter();
    return Remoter;
  }();
}).call(this);
