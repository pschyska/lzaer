(function() {
  var Remoter;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __slice = Array.prototype.slice;
  Remoter = function() {
    function Remoter() {
      this.__generateEndpointProxy = __bind(this.__generateEndpointProxy, this);;      ({
        url: "/remoting_controller"
      });
    }
    Remoter.prototype.__callServer = function(strFun, arg) {
      return alert(strFun + ': ' + arg);
    };
    Remoter.prototype.__generateEndpointProxy = function(proxy) {
      return this[proxy] = function() {
        var args;
        args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        if (args.length > 0) {
          return eval("this.__callServer('" + proxy + "',JSON.stringify(" + args + "));");
        } else {
          return eval("this.__callServer('" + proxy + "');");
        }
      };
    };
    return Remoter;
  }();
  window.Remoter = Remoter;
}).call(this);
