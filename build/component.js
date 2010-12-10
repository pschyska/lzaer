(function() {
  var Component;
  module.exports = Component = function() {
    var Client, Server;
    function Component() {
      this.server = new Server();
      this.client = new Client();
    }
    Server = function() {
      function Server() {
        throw "Cannot instantiate abstract Component";
      }
      return Server;
    }();
    Client = function() {
      function Client() {
        throw "Cannot instantiate abstract Component";
      }
      Client.prototype.render = function() {
        throw "render() not implemented yet.";
      };
      return Client;
    }();
    return Component;
  }();
}).call(this);
