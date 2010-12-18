(function() {
  var clientCode, k, v, _ref, _results;
  clientCode = "Ext.ns 'Ekzten.classes', 'Ekzten.components'\nEkzten.classes." + this.component.constructor.name + "=`" + (this.component.client.toString()) + "`\nEkzten.components." + (this.component.globalId()) + "=new Ekzten.classes." + this.component.constructor.name + "()\n" + (function() {
    _ref = this.component.endpoints();
    _results = [];
    for (k in _ref) {
      v = _ref[k];
      _results.push("Ekzten.remoter.__generateEndpointProxy Ekzten.components." + (this.component.globalId()) + ", '" + (this.component.globalId()) + "','" + k + "'\n");
    }
    return _results;
  }.call(this)) + "\n  \nEkzten.components." + (this.component.globalId()) + ".server = Ekzten.remoter." + (this.component.globalId());
  text(CoffeeScript.compile(clientCode));
}).call(this);
