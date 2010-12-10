module.exports = 
  index: (request, response) ->
    User.find().all (users) ->
      response.send
        result: users
        total: users.length
  create: (request, response) ->
    u = new User()
    u.firstName = 'John'
    u.name = 'Doe'
    u.username = 'jodo'
    u.save()