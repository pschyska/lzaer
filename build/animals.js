(function() {
  var Animal, Horse, Snake, sam, sys, tom;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  sys = require('sys');
  Animal = function() {
    function Animal(name) {
      this.name = name;
    }
    Animal.prototype.move = function(meters) {
      return sys.puts(this.name + " moved " + meters + "m.");
    };
    return Animal;
  }();
  Snake = function() {
    function Snake() {
      Snake.__super__.constructor.apply(this, arguments);
    }
    __extends(Snake, Animal);
    Snake.prototype.move = function() {
      sys.puts("Slithering...");
      return Snake.__super__.move.call(this, 5);
    };
    return Snake;
  }();
  Horse = function() {
    function Horse() {
      Horse.__super__.constructor.apply(this, arguments);
    }
    __extends(Horse, Animal);
    Horse.prototype.move = function() {
      sys.puts("Galloping...");
      return Horse.__super__.move.call(this, 45);
    };
    return Horse;
  }();
  sam = new Snake("Sammy the Python");
  tom = new Horse("Tommy the Palomino");
  sam.move();
  tom.move();
}).call(this);