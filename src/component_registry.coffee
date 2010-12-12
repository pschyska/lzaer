module.exports=
  components: {}
  register: (component) ->
    throw "component of class #{component.constructor.name} called #{component.name} has been registered before as globalId #{component.globalId}" if @components[component.globalId()]
    @components[component.globalId()]=component
  get: (globalId) ->
    @components[globalId]