class @Board
  @utility = 0;
  @boardShift = {0,0}
  @board = undefined;
  constructor: (svg_selector)->
    @board = Snap svg_selector
    @board_group = @board.group()
    boardOffsetX = 0
    boardOffsetY = 0
    elements = {}
    uml = new UMLBlock(@board, "Test", 100, 100, 150,
      {"test_field1": 'int', "test_field2": 'int'},
      {"test":1, "test2":3, "test3":4})
    elements[uml.get_hash()] = uml

  getBoard: -> @board


