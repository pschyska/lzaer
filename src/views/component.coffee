clientCode=
  """
    Ext.ns 'Ekzten.classes', 'Ekzten.components'
    Ekzten.classes.#{@component.constructor.name}=`#{@component.client.toString()}`
    Ekzten.components.#{@component.globalId()}=new Ekzten.classes.#{@component.constructor.name}()
    #{for k, v of @component.endpoints()
      "Ekzten.remoter.__generateEndpointProxy Ekzten.components.#{@component.globalId()}, '#{@component.globalId()}','#{k}'\n"
    }
      
    Ekzten.components.#{@component.globalId()}.server = Ekzten.remoter.#{@component.globalId()}
  """

text CoffeeScript.compile clientCode