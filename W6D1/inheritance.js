Function.prototype.inherits = function (parent) {
  function Surrogate() {}
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};

Function.prototype.inherits2 = function (parent) {
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
};

function MovingObject (radius) {
  this.radius = radius;
  this.direction = "one direction";
}

function Ship (cannons) {
  this.cannons = cannons;
}
Ship.inherits(MovingObject);

function Asteroid (howdead) {
  this.howdead = howdead;
}
Asteroid.inherits(MovingObject);

MovingObject.prototype.firelasers = function() {
  console.log("pew peew, pew peew");
};
