# ioc container for composition and component registry
  # maybe try to get CommonJS modules into client

# TODO: check if endpoint defined server-side
# TODO: check if user is permitted for this component
#       TODO: store components user-wise

# evtl. onChage event für clients mit server push (multiplexed)

# DONT EVAL WHAT THE CLIENT SENDS. DETERMINE THE FUNCTION WITH this[fun].call(JSON.parse args)

module.exports.Component=class Component
  constructor: (@name, @endpoints)->
    throw "Need a name" unless @name
    ComponentRegistry.register this
  globalId: ->
    @name.replace(/[^0-9A-Za-z_]/, '-').replace /(\-[a-z])/g, ($1) -> 
      $1.toUpperCase().replace '-',''
  render: ->
    throw "i'm abstract, sorry!"

module.exports.Counter=class Counter extends Component
  constructor: (name)->
    super name, @endpoints
    @counter=0

  privateFunction: ->
    "the client can not call me"

  endpoints: ->
    count: (howMany=1)=>
      @counter+=howMany
      # return some function to be eval'd on the client
      # TODO: user should never have to pass code as strings, find a nice way to expand @'s
      CoffeeScript.compile """      
        @widget.setTitle "The servers says the counter says its at #{@counter}"
        """
            
  render: ->
    client=
      someClientVal: 0
      someClientFunction: ->
        @someClientVal++
      someEndpointFunction: ()->
        @server.count(1);
    widget= Ext.create
      xtype: 'panel'
      header: true
      title: "Some panel"
      items:
        * xtype: 'button', text: 'Click me, please', handler: ->
          client.someEndpointFunction()
    client.widget=widget
    client