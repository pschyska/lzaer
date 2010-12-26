# ioc container for composition and component registry
  # maybe try to get CommonJS modules into client

# TODO: check if endpoint defined server-side
# TODO: check if user is permitted for this component
#       TODO: store components user-wise

# evtl. onChage event für clients mit server push (multiplexed)

module.exports.Component=class Component
  constructor: (@name, @endpoints)->
    throw "Need a name" unless @name
    ComponentRegistry.register this
  globalId: ->
    @name.replace(/[^0-9A-Za-z_]/g, "-").replace /\-+(.)?/g, (match, char) ->
      (char || '').toUpperCase()

  endpointConfig= (endpoints)->
    res=[]
    for k, v of endpoints
      if v && k!="prototype" && k!="__super__"
        res += "{'name':'#{k}' , 'len':#{v.length}}"
    res

  clientBaseClass: ->
    if @constructor.__super__? then "NextJs.classes."+@constructor.__super__.constructor.name else "Ext.Component"
  
  missingClasses: ->
    res=""
    unless ClassRegistry.clientHasClass(@constructor.name)
      res+="classdef=`#{@client.toString()}`\n"
      res+="NextJs.classes.#{@constructor.name}=Ext.extend #{@clientBaseClass()}, classdef()" #  unless NextJs.classes.#{@constructor.name} this is not needed as class registry prevents double definition
      ClassRegistry.register @constructor.name
    res

    if @constructor.name!='Component'
      res=@constructor.__super__.missingClasses()+'\n'+res
    res
  
    
  render: () ->

    clientCode=
      """
        Ext.ns "NextJs.providers", "NextJs.classes", "NextJs.components"

        #{@missingClasses()}          
          
        Ext.Direct.addProvider
          "type":"remoting"
          "url":"components"
          "actions":
            "#{@globalId()}":[
              #{endpointConfig(@endpoints)}
            ]
          "namespace":"NextJs.providers"
          # TODO: walk up in class hierarchy and generate missing class code
            # test by comparing class ev oucnt on counter, count+subcounter, subcounter usage

        config=`#{@clientConfig.toString()}`
        NextJs.components.#{@globalId()}=new NextJs.classes.#{@constructor.name}(config())

        NextJs.components.#{@globalId()}.server = NextJs.providers.#{@globalId()}
      """
    CoffeeScript.compile clientCode
  clientConfig: ->
  client: ->
    isNextJs: true
module.exports.Counter=class Counter extends Component
  constructor: (name, endpoints={})->
    super name, @endpoints extends endpoints
    @counter=0

  endpoints:
    count: (howMany=1)=>
      @counter+=howMany
      # TODO: Dont return function here as it doesnt work with inheritance
      ->
        @widget.setTitle "The servers says the counter says its at #{$counter}"
            
  clientConfig: ->
    xtype: "panel"
    header: true
    title: "Some panel"
    items: [
      { xtype: "button", text: "Click me, please", handler: ->
          client.someEndpointFunction() }
      ]    
  client: ->
    someClientVal: 0
    someClientFunction: ->
      @someClientVal++
    someEndpointFunction: ()->
      @server.count(1);
    
module.exports.SubCounter=class SubCounter extends Counter
  constructor: (name, endpoints={})->
    super name, @endpoints extends endpoints

  endpoints:
    count: =>
      super(2)

  client: ()->
    someClientVal: 0
    someClientFunction: ->
      super
      super