sys=require 'sys'
util=require 'util'
#Remoter=require './remoter'


# ioc container für composition

# class loader zum nachladn von klassen vom server zum client

# TODO: check if endpoint defined server-side
# TODO: check if user is permitted for this component
#       TODO: store components user-wise

# evtl. onChage event für clients mit server push (multiplexed)

# DONT EVAL WHAT THE CLIENT SENDS. DETERMINE THE FUNCTION WITH this[fun].call(JSON.parse args)
callServer=(strFun,arg)->
  sys.puts "calling #{strFun} with #{arg}"
  fun=eval strFun
  fun(arg)


endpoints=['a','b','c']
# a={}
# for endpoint in endpoints
#   a[endpoint]= (args...)->
#     sys.puts("callServer('#{endpoint}',#{JSON.stringify args})")
#     this['callServer'](endpoint, JSON.stringify args )
# #    eval("callServer('#{endpoint}',#{JSON.stringify args})")
# 
# obj=
#   a: 1
#   b: 2
#   c:
#     d: 2
#     e: 3
#     f: [1,2,3,4]
#     x: endpoints
# 
# 
# sys.puts a.b(obj)

class Component
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

class Counter extends Component
  constructor: (name)->
    super name, @endpoints
    @counter=1

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

counter=new Counter('some counter')
# client=counter.render()
# sys.puts util.inspect counter.renderThruParent()
# # sys.puts client.someClientFunction()
# # sys.puts client.someClientFunction()
# # sys.puts client.someClientFunction()
# # sys.puts client.server.count(10)
# 
# sys.puts counter.getClient()

http = require 'http';
server=http.createServer (req, res) ->
  res.writeHead 200,
    'Content-Type': 'application/json'
#  res.send ""
  res.end counter.getClient()
server.listen 8124, "127.0.0.1"