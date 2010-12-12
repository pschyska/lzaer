class Remoter
  __callServer: (client, componentId, endpoint, jsonArg)->
    Ext.Ajax.request
      url: "/components/#{componentId}/#{endpoint}/#{jsonArg}"
      success: (response, opts) ->
        Function(response.responseText).apply client
      failure: (response, opts) ->
        alert "Oh noe, something bad called #{response.status} happened"
        
  __generateEndpointProxy: (client, componentId, endpoint) =>
    this[componentId]={}
    this[componentId][endpoint]= (args...)=>
      if args.length > 0
        this.__callServer client, componentId, endpoint, JSON.stringify args
      else
        this.__callServer client, componentId, endpoint, JSON.stringify args
  Ext.ns 'Ekzten', 'Ekzten.classes'
  Ekzten.classes.Remoter = this
  Ekzten.remoter=new Ekzten.classes.Remoter()