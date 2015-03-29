// Generated by CoffeeScript 1.9.1
(function() {
  this.Board = (function() {
    Board.utility = 0;

    Board.utility_name = '';

    Board.boardShift = {
      0: 0,
      0: 0
    };

    Board.board = void 0;

    function Board(svg_selector) {
      var boardOffsetX, boardOffsetY, elements;
      this.board = Snap(svg_selector);
      boardOffsetX = 0;
      boardOffsetY = 0;
      elements = {};
      programEvents.on('util-changed', function(util, util_name) {
        Board.utility = util;
        return Board.utility_name = util_name;
      });
      socket.on('updateElement', (function(_this) {
        return function(connection_color, hash, data) {
          var new_block;
          if (elements[hash]) {
            return elements[hash].update(data.params);
          } else {
            new_block = new UMLBlock(_this, data.params, hash);
            return elements[new_block.get_hash()] = new_block;
          }
        };
      })(this));
      this.board.click((function(_this) {
        return function(e) {
          var uml;
          if (Board.utility_name === 'uml-block') {
            console.log(e);
            uml = new UMLBlock(_this, {
              x: e.offsetX,
              y: e.offsetY,
              width: 0,
              height: 0,
              fields: {},
              methods: {}
            });
            return elements[uml.get_hash()] = uml;
          }
        };
      })(this));
    }

    Board.prototype.getBoard = function() {
      return this.board;
    };

    return Board;

  })();

}).call(this);

//# sourceMappingURL=Board.js.map
