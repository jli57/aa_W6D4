const View = require("./ttt-view.js");
const Game = require("./game.js");// require appropriate file

s = new Game();

$( () => {
  let myGame = new Game();
  new View(myGame, $(".ttt"));
  
  // $("figure.ttt").css("background-color", "hotpink");

  
});



