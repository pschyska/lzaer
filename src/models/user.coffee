mongoose.model 'User', {

  properties: ['username', 'firstName', 'name'] 

  # indexes : [
  #   'username',
  #   'bio.age',
  #   [['first'],['last']] // compound key indexes
  # ],

  # static : {}, // adds methods onto the Model.
  # methods : {}, // adds methods to Model instances.
  # 
  # setters: { // custom setters
  #   first: function(v){
  #     return v.toUpperCase();
  #   }
  # },

  getters: 
    fullName: ->
      this.firstName + ' ' + this.name
}