require('./setup').setup()

createTestUser = ->
  u = new User()
  u.firstName = 'John'
  u.name = 'Doe'
  u.username = 'jodo'
  u.save ->
    sys.puts 'Successfully saved test user'

listAllUsers = (response)->
  query=User.find()
  query.all (users) ->
    res=for user in users
      user.fullName
    sys.puts "write users to response"
    response.write res.join '\n'


server = http.createServer (req, res) ->
  res.writeHead 200, {'Content-type': 'text/plain' }
  res.write 'Hello, World!'
  createTestUser()
  listAllUsers(res)
  sys.puts "ending response"
  res.end()

server.listen 3000

sys.puts 'Listening port: over 9000 ... just kidding it\'s 3000'
sys.puts 'http://localhost:3000'