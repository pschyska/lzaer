counter=new Counter('some counter')

module.exports = 
  index: (request, response) ->
    response.render 'component'
      # context:
      #   title: 'Lzaer'