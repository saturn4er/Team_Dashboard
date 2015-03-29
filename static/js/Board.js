// Generated by CoffeeScript 1.9.1
(function() {
  this.Board = (function() {
    Board.utility = 0;

    Board.boardShift = {
      0: 0,
      0: 0
    };

    Board.board = void 0;

    function Board(svg_selector) {
      var boardOffsetX, boardOffsetY, elements, uml;
      this.board = Snap(svg_selector);
      this.board_group = this.board.group();
      boardOffsetX = 0;
      boardOffsetY = 0;
      elements = {};
      uml = new UMLBlock(this.board, "Test", 100, 100, 150, {
        "test_field1": 'int',
        "test_field2": 'int'
      }, {
        "test": 1,
        "test2": 3,
        "test3": 4
      });
      elements[uml.get_hash()] = uml;
    }

    Board.prototype.getBoard = function() {
      return this.board;
    };

    return Board;

  })();

}).call(this);

//# sourceMappingURL=Board.js.map
