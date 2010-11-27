(function() {
  var http, server, sys;
  sys = require('sys');
  http = require('http');
  server = http.createServer(function(req, res) {
    res.writeHead(200, {
      'Content-type': 'text/plain'
    });
    res.write('Hello, World!');
    return res.end();
  });
  server.listen(3000);
  sys.puts('Listening port: over 9000 ... just kidding it\'s 3000');
  sys.puts('http://localhost:3000');
}).call(this);
