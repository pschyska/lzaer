(function() {
  var app;
  app = require('../setup').setup();
  module.exports = {
    'GET /': function(assert) {
      return assert.response(app, {
        url: '/'
      }, {
        status: 200,
        headers: {
          'Content-Type': 'text/html; charset=utf-8'
        }
      }, function(res) {
        return assert.includes(res.body, '<title>Express</title>');
      });
    }
  };
}).call(this);
