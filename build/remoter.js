(function() {
  var Remoter;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __slice = Array.prototype.slice;
  Remoter = function() {
    function Remoter() {
      this.__generateEndpointProxy = __bind(this.__generateEndpointProxy, this);;      ({
        url: "/remoting_controller"
      });
    }
    Remoter.prototype.__callServer = function(componentId, endpoint, jsonArg) {
      return alert(componentId + ' ' + endpoint + ': ' + jsonArg);
    };
    Remoter.prototype.__generateEndpointProxy = function(componentId, proxy) {
      this[componentId] = {};
      return this[componentId][proxy] = __bind(function() {
        var args;
        args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        if (args.length > 0) {
          return eval("this.__callServer('" + componentId + "', '" + proxy + "',JSON.stringify(" + args + "));");
        } else {
          return eval("this.__callServer('" + componentId + "', '" + proxy + "');");
        }
      }, this);
    };
    Ext.ns('Ekzten', 'Ekzten.classes');
    Ekzten.classes.Remoter = Remoter;
    Ekzten.remoter = new Ekzten.classes.Remoter();
    return Remoter;
  }();
}).call(this);
