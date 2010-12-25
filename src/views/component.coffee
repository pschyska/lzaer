clientCode=
  """
    Ext.ns 'NextJs.providers', 'NextJs.classes', 'NextJs.components'
    Ext.Direct.addProvider
      "type":"remoting"
      "url":"components"
      "actions":
        "#{@component.globalId()}":[
          #{for k, v of @component.endpoints()
            "{'name':'#{k}' , 'len':#{v.length}}"
          }

          { "name":"doEcho", "len":1 },
          { "name":"multiply", "len":1 },
        ]
      "namespace":"NextJs.providers"
    
    NextJs.classes.#{@component.constructor.name}=`#{@component.client.toString()}` unless Ekzten.classes.#{@component.constructor.name}
    NextJs.components.#{@component.globalId()}=new NextJs.classes.#{@component.constructor.name}()
      
    NextJs.components.#{@component.globalId()}.server = NextJs.providers.#{@component.globalId()}
  """

text CoffeeScript.compile clientCode