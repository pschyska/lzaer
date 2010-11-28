(function() {
  var createTestUser, listAllUsers, server;
  require('./setup').setup();
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
    query = User.find();
    return query.all(function(users) {
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
      return response.write(res.join('\n'));
    });
  };
  server = http.createServer(function(req, res) {
    res.writeHead(200, {
      'Content-type': 'text/plain'
    });
    res.write('Hello, World!');
    createTestUser();
    listAllUsers(res);
    sys.puts("ending response");
    return res.end();
  });
  server.listen(3000);
  sys.puts('Listening port: over 9000 ... just kidding it\'s 3000');
  sys.puts('http://localhost:3000');
}).call(this);
