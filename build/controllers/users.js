(function() {
  module.exports = {
    index: function(request, response) {
      return User.find().all(function(users) {
        return response.send({
          result: users,
          total: users.length
        });
      });
    },
    create: function(request, response) {
      var u;
      u = new User();
      u.firstName = 'John';
      u.name = 'Doe';
      u.username = 'jodo';
      return u.save();
    }
  };
}).call(this);
