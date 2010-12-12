(function() {
  module.exports = {
    components: {},
    register: function(component) {
      if (this.components[component.globalId()]) {
        throw "component of class " + component.constructor.name + " called " + component.name + " has been registered before as globalId " + component.globalId;
      }
      return this.components[component.globalId()] = component;
    },
    get: function(globalId) {
      return this.components[globalId];
    }
  };
}).call(this);
