global.sys = require 'sys'
global.http = require 'http'

require('./setup').setup()

server = http.createServer (req, res) ->
  res.writeHead 200, {'Content-type': 'text/plain' }
  res.write 'Hello, World!'
  
  res.end()

server.listen 3000

sys.puts 'Listening port: over 9000 ... just kidding it\'s 3000'
sys.puts 'http://localhost:3000'