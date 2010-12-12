module.exports = 
  index: (request, response) ->
    response.render 'component'
      layout: false
      context:
        component: Components.counter
  endpoint: (request, response) ->
    result=
      ComponentRegistry.get(request.params.componentId).endpoints()[request.params.endpoint](JSON.parse(request.params.args)...)
    response.send result