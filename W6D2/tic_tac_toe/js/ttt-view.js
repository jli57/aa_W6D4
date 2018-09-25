class View {
  
  
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    
    this.$el.on("click", "li", e => {
      debugger;
      const $square = $(e.currentTarget);
      this.makeMove($square);
    });
    // $("li").on("click", e => {
    //   const $sq = $(e.currentTarget);
    //   // alert($sq.data("pos"));
    //   // alert(this.game.playMove($sq.data("pos")));
    // });
    
  }

  
  makeMove($square) {
    debugger;
    this.game.playMove($square.data("pos"));

    
    // catch(e) {
    //   alert("your move sucks");
    //   return;
    // }
    

    // display their move
    $square.addClass("filled");
    $square.addClass(this.game.currentPlayer);
    $square.append(this.game.currentPlayer);
    // switch turns
      
      let x = this.game.board;
      let y = this.game.winner();
    if (this.game.isOver()) {
      if (this.game.winner()) {
        // alert(`WOW GREAT JOB ${this.game.currentPlayer}!!!!!!!`);
        alert("hi winner");
      }
    }
      

    
  }

  setupBoard() {
    const $ul = $("<ul>");

    for (let rowIdx = 0; rowIdx < 3; rowIdx++) {
      for (let colIdx = 0; colIdx < 3; colIdx++) {
        let $li = $("<li>");
        $li.data("pos", [rowIdx, colIdx]);

        $ul.append($li);
      }
    }

    this.$el.append($ul);
    
  }
}

module.exports = View;
