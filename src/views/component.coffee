clientCode=
  """
    #{for k, v of @component.endpoints()
      "Ekzten.remoter.__generateEndpointProxy '#{@component.globalId()}','#{k}'\n"
    }

    Ext.ns 'Ekzten.classes', 'Ekzten.components'
    Ekzten.classes.#{@component.constructor.name}=`#{@component.render.toString()}`
    Ekzten.components.#{@component.globalId()}=new Ekzten.classes.#{@component.constructor.name}()
    Ekzten.components.#{@component.globalId()}.server = Ekzten.remoter.#{@component.globalId()}
  """

text CoffeeScript.compile clientCode