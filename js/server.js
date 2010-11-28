(function() {
  var app, createTestUser, listAllUsers;
  app = require('./setup').setup();
  createTestUser = function() {
    var u;
    u = new User();
    u.firstName = 'John';
    u.name = 'Doe';
    u.username = 'jodo';
    return u.save(function() {
      return sys.puts('Successfully saved test user');
    });
  };
  listAllUsers = function(response) {
    var query;
    return query = User.find().all(function(users) {
      var res, user, _i, _len, _results;
      res = function() {
        _results = [];
        for (_i = 0, _len = users.length; _i < _len; _i++) {
          user = users[_i];
          _results.push(user.fullName);
        }
        return _results;
      }();
      sys.puts("write users to response");
      response.write(res.join('\n'));
      return response.end();
    });
  };
  if (!module.parent) {
    app.listen(3000);
    console.log("Express server listening on port", app.address().port);
  }
}).call(this);
