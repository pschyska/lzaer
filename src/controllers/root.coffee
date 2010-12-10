module.exports = 
  index: (request, response) ->
    response.render 'index'
      context:
        title: 'Lzaer'
