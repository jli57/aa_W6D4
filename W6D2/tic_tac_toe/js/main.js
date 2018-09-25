const View = require("./ttt-view.js");
const Game = require("./game.js");// require appropriate file


$( () => {
  let myGame = new Game();
  debugger
  new View(myGame, $(".ttt"));
  
  // $("figure.ttt").css("background-color", "hotpink");

  
});



