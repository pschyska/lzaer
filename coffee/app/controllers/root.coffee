module.exports = 
  index: (request, response) ->
    response.render 'index'
      locals:
        title: 'Lzaer'
