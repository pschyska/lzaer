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

module.exports = 
  index: (request, response) ->
    response.render 'index'
      locals:
        title: 'Lzaer'
      # var user=new User();
      # user.first_name = "John";
      # user.last_name = "Doe";
      # user.save();
      #       User.find().all(function(users){
      #         response.send({
      #           results :  users,
      #           total : users.length
      #         })
      #       });