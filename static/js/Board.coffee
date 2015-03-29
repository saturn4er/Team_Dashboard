class @Board
  @utility = 0;
  @utility_name = ''
  @boardShift = {0, 0}
  @board = undefined;
  constructor: (svg_selector)->
    @board = Snap svg_selector
    boardOffsetX = 0
    boardOffsetY = 0
    elements = {}

    programEvents.on('util-changed', (util, util_name)->
      Board.utility = util;
      Board.utility_name = util_name
    )
    socket.on('updateElement', (connection_color, hash, data)=>
      if elements[hash]
        elements[hash].update data.params
      else
        new_block = new UMLBlock @, data.params, hash
        elements[new_block.get_hash()] = new_block
    )
    @board.click (e)=>
      if Board.utility_name == 'uml-block'
        console.log(e)
        uml = new UMLBlock @, x: e.offsetX, y: e.offsetY, width: 0, height: 0, fields:{}, methods: {}
        elements[uml.get_hash()] = uml

  getBoard: -> @board


