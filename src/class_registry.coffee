# this registers component classes (client side Ext classes). it is able to determine if a client already has some class.
# TODO: attach to session

module.exports=
  classes: {}
  register: (clazz) ->
    throw "class #{clazz.name} has been registered before" if @classes[clazz.name]
    @classes[clazz.name]=clazz
  clientHasClass: (className) ->
    @classes[globalId]
      # TODO: code for pushing Ext class to client and registering it