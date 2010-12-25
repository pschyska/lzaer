(function() {
  module.exports = {
    classes: {},
    register: function(clazz) {
      if (this.classes[clazz.name]) {
        throw "class " + clazz.name + " has been registered before";
      }
      return this.classes[clazz.name] = clazz;
    },
    clientHasClass: function(className) {
      return this.classes[globalId];
    }
  };
}).call(this);
