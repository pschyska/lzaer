class Remoter
  constructor: ->
#    @connection = new Ext.data.Connection
      url: "/remoting_controller"
  __callServer: (componentId,endpoint,jsonArg)->
    alert(componentId+' '+ endpoint+': '+jsonArg)
 #   @connection.send
    # fun=eval strFun
    # fun(arg)
  __generateEndpointProxy: (componentId, proxy) =>
    this[componentId]={}
    this[componentId][proxy]= (args...)=>
      if args.length > 0
        eval "this.__callServer('#{componentId}', '#{proxy}',JSON.stringify(#{args}));"
      else
        eval "this.__callServer('#{componentId}', '#{proxy}');"
  Ext.ns 'Ekzten', 'Ekzten.classes'
  Ekzten.classes.Remoter = this
  Ekzten.remoter=new Ekzten.classes.Remoter()