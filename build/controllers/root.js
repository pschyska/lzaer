(function() {
  module.exports = {
    index: function(request, response) {
      return response.render('index', {
        context: {
          title: 'Lzaer'
        }
      });
    }
  };
}).call(this);
