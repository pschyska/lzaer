
endpointConfig= (endpoints) ->
  res=[]
  for k, v of endpoints
    if v && k!="prototype"
      res += "{"name":"#{k}" , "len":#{v.length}}"
  res
  

clientCode=
  """
    Ext.ns "NextJs.providers", "NextJs.classes", "NextJs.components"
    Ext.Direct.addProvider
      "type":"remoting"
      "url":"components"
      "actions":
        "#{@component.globalId()}":[
          #{endpointConfig(@component.endpoints)}
        ]
      "namespace":"NextJs.providers"
    
    testclass=#{@component.clientBaseClass()}
    NextJs.classes.#{@component.constructor.name}=`#{@component.client.toString()}` unless Ekzten.classes.#{@component.constructor.name}
    NextJs.components.#{@component.globalId()}=new NextJs.classes.#{@component.constructor.name}()
      
    NextJs.components.#{@component.globalId()}.server = NextJs.providers.#{@component.globalId()}
  """

text CoffeeScript.compile clientCode