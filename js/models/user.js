(function() {
  mongoose.model('User', {
    properties: ['username', 'firstName', 'name'],
    getters: {
      fullName: function() {
        return this.firstName + ' ' + this.name;
      }
    }
  });
}).call(this);
