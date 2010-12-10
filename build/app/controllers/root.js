(function() {
  module.exports = {
    index: function(request, response) {
      return response.render('index', {
        locals: {
          title: 'Lzaer'
        }
      });
    }
  };
}).call(this);
