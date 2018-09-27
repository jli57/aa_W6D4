const DOMNodeCollection = require('./dom_node_collection.js');

$(() => {

  // $(".list").css("background-color", "red");


});

// document.addEventListener("DOMContentLoaded", )
window.$l = function(argument) {

  if ( argument instanceof HTMLElement ) {
    console.log("hi");
    return new DOMNodeCollection([argument]);
  } else {
    const nodeList = document.querySelectorAll(argument);
    const array = Array.from(nodeList);
    return new DOMNodeCollection(array);
  }
};
