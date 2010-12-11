# ioc container for composition
  # try to get CommonJS modules into client

# TODO: check if endpoint defined server-side
# TODO: check if user is permitted for this component
#       TODO: store components user-wise

# evtl. onChage event für clients mit server push (multiplexed)

# DONT EVAL WHAT THE CLIENT SENDS. DETERMINE THE FUNCTION WITH this[fun].call(JSON.parse args)

module.exports.Component=class Component
  constructor: (@name, @endpoints)->
    throw "Need a name" unless @name
    @interface={}    
    sys.puts "I'm a #{@constructor.name} called #{name} and waiting for work!"
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
            
  render: ->
    someClientVal: 0
    someClientFunction: ->
      @someClientVal++
    someEndpointFunction: (arg)->
      @server.count(arg);