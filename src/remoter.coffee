class Remoter
  constructor: ->
#    @connection = new Ext.data.Connection
      url: "/remoting_controller"
  __callServer: (strFun,arg)->
    alert(strFun+': '+arg)
 #   @connection.send
    # fun=eval strFun
    # fun(arg)
  __generateEndpointProxy: (proxy) =>
    this[proxy]= (args...)->
      if args.length > 0
        eval "this.__callServer('#{proxy}',JSON.stringify(#{args}));"
      else
        eval "this.__callServer('#{proxy}');"

window.Remoter=Remoter
# remoter=new Remoter()
# remoter.__generateEndpointProxies(['someEndpoint'])
# 
# remoter.someEndpoint("some argument",1,2,new Remoter(), [1,2,3])
