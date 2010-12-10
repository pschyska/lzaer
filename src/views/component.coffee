# clientCode="var remoter=new window.Remoter();\n"
# for k, v of @endpoints()
#   sys.puts k
#   sys.puts v      
#   clientCode+="remoter.__generateEndpointProxy('#{k}')"
# clientCode+="\n; \n"
#     
# clientCode+="var Client="
# clientCode+=@render.toString()
# clientCode+=";\nwindow.client=new Client();\n"
# clientCode+="client.server=remoter; \n"
# clientCode
coffeescript -> "bleurgh"