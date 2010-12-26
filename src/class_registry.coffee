# this registers component classes (client side Ext classes). it is able to determine if a client already has some class.
# TODO: attach to session

module.exports=
  classes: {}
  register: (className) ->
    throw "class #{className} has been registered before" if @classes[className]
    @classes[className]=true
  clientHasClass: (className) ->    
    @classes[className]