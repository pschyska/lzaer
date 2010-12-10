module.exports=class Component
  constructor: ->
    @server=new Server()
    @client=new Client()    
  
  class Server
    constructor: ->
      throw "Cannot instantiate abstract Component"
  class Client
    constructor: ->
      throw "Cannot instantiate abstract Component"
    render: ->
      throw "render() not implemented yet."