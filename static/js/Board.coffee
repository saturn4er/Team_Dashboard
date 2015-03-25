class @Board
  board = undefined;
  constructor: (svg_selector)->
    board = Snap(svg_selector)
    uml = new UMLBlock(board, "Test", 100, 100, 300, 100, {"test_field1": 'int', "test_field2": 'int'},
      ['testMethod()'])