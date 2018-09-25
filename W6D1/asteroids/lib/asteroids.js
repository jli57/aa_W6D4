const MovingObject = require("./moving_object.js");

document.addEventListener("DOMContentLoaded", function () {
  window.canvas = document.getElementById("game-canvas");
  window.ctx = canvas.getContext('2d');
  
  window.MovingObject = MovingObject;

  window.mo = new MovingObject(
    { pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00"}
  ); 
  
  mo.draw(ctx);
});
// var canvas = document.getElementById('game-canvas');
// var ctx = canvas.getContext('2d');



// mo.draw(ctx);