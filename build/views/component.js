(function() {
  var clientCode, k, v, _ref, _results;
  clientCode = "Ext.ns 'NextJs.providers', 'NextJs.classes', 'NextJs.components'\nExt.Direct.addProvider\n  \"type\":\"remoting\"\n  \"url\":\"components\"\n  \"actions\":\n    \"" + (this.component.globalId()) + "\":[\n      " + (function() {
    _ref = this.component.endpoints();
    _results = [];
    for (k in _ref) {
      v = _ref[k];
      _results.push("{'name':'" + k + "' , 'len':" + v.length + "}");
    }
    return _results;
  }.call(this)) + "\n\n      { \"name\":\"doEcho\", \"len\":1 },\n      { \"name\":\"multiply\", \"len\":1 },\n    ]\n  \"namespace\":\"NextJs.providers\"\n\nNextJs.classes." + this.component.constructor.name + "=`" + (this.component.client.toString()) + "` unless Ekzten.classes." + this.component.constructor.name + "\nNextJs.components." + (this.component.globalId()) + "=new NextJs.classes." + this.component.constructor.name + "()\n  \nNextJs.components." + (this.component.globalId()) + ".server = NextJs.providers." + (this.component.globalId());
  text(CoffeeScript.compile(clientCode));
}).call(this);
