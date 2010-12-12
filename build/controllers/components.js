(function() {
  module.exports = {
    index: function(request, response) {
      return response.render('component', {
        layout: false,
        context: {
          component: Components.counter
        }
      });
    },
    endpoint: function(request, response) {
      var result, _ref;
      result = (_ref = ComponentRegistry.get(request.params.componentId).endpoints())[request.params.endpoint].apply(_ref, JSON.parse(request.params.args));
      return response.send(result);
    }
  };
}).call(this);
