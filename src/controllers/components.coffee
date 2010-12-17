module.exports = 
  index: (request, response) ->
    response.render 'component'
      layout: false
      context:
        component: Components.counter
  endpoint: (request, response) ->
    component=ComponentRegistry.get(request.params.componentId)
    result=
      component.endpoints()[request.params.endpoint](JSON.parse(request.params.args)...).toString()
    serverExpansion = /\$[a-zA-Z0-9]*/
    
    expansion=result.match serverExpansion
    while expansion
      result=result.replace expansion[0], component[expansion[0][1..]]
      expansion=result.match serverExpansion
    response.send '('+result+').call(this)'