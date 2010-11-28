app = require('./setup').setup()

createTestUser = ->
  u = new User()
  u.firstName = 'John'
  u.name = 'Doe'
  u.username = 'jodo'
  u.save ->
    sys.puts 'Successfully saved test user'

listAllUsers = (response)->
  query=User.find().all (users) ->
    res=for user in users
      user.fullName
    sys.puts "write users to response"
    response.write res.join '\n'
    response.end()

if (!module.parent)
  app.listen 3000
  console.log "Express server listening on port", app.address().port
