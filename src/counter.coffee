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
  render: (response) ->
    response.render 'component'
      layout: false
      context:
        component: this
  client: ->
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
      # TODO: Don't return function here as it doesn't work with inheritance
      ->
        @widget.setTitle "The servers says the counter says its at #{$counter}"
            
  # TODO: Don't return fucntion here as it doesn't work with inheritance
  #   you have to return a function because the code is not executable on the server
  #   TODO: solution: handle inheritance on the client side. For this create class registry and define Ext classes
  client: ->
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