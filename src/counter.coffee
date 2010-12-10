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
  getClient: ->
    # puts generated endpoint proxies here
      
    clientCode="var remoter=new window.Remoter();\n"
    for k, v of @endpoints()
      sys.puts k
      sys.puts v      
      clientCode+="remoter.__generateEndpointProxy('#{k}')"
    clientCode+="\n; \n"
        
    clientCode+="var Client="
    clientCode+=@render.toString()
    clientCode+=";\nwindow.client=new Client();\n"
    clientCode+="client.server=remoter; \n"
    clientCode
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
    someEndpointFunction: ->
      @server.count();