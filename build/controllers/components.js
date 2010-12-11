(function() {
  var counter;
  counter = new Counter('some counter');
  module.exports = {
    index: function(request, response) {
      return response.render('component', {
        layout: false,
        context: {
          component: counter
        }
      });
    }
  };
}).call(this);
