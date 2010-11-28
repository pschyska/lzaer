(function() {
  var app;
  app = require('./setup').setup();
  if (!module.parent) {
    app.listen(3000);
    console.log("Express server listening on port", app.address().port);
  }
}).call(this);
