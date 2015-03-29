uml_block_class = 'uml_block'
min_container_width = 200

percents_per_label = 14

min_label_box_height = 25
min_method_box_height = 25
min_field_box_height = 25

class @UMLBlock extends DefaultElement
  constructor: (@board, @params, @hash)->
    super(@board, 'uml-block', @params, @hash)
    unless @hash
      @hash = Math.random().toString(36).substr(2, 15)

    @svg = @board.getBoard()
    @focused = false
    @container = @svg.rect(1, 1, 100, 100)
    @container.addClass(uml_block_class + '__container')

    @label_box = @svg.rect(1, 1, 1, 1)
    @label_box.addClass(uml_block_class + '__label_box')


    @uml_block = @svg.group(@container, @label_box)
    @uml_block.addClass('uml_block')
    @redraw()
    @drag()
    @setFocusable()

  recalculate_dimensions: ()->
    @params.width = min_container_width if @params.width < min_container_width
    default_label_height = @params.height * percents_per_label / 100
    @label_height =
      if default_label_height < min_label_box_height
        min_label_box_height
      else
        default_label_height

    @fields_count = Object.keys(@params.fields).length
    @methods_count = Object.keys(@params.methods).length

    default_field_height = ( @params.height - @label_height ) / (@fields_count + @methods_count)

    @method_height =
      if default_field_height < min_method_box_height
        min_method_box_height
      else
        default_field_height

    @field_height =
      if default_field_height < min_field_box_height
        min_field_box_height
      else
        default_field_height

  redraw: ()->
    super()
    @recalculate_dimensions()
    container_height = @label_height + @method_height * @methods_count + @field_height * @fields_count
    @container.attr width: @params.width, height: container_height, x: @params.x, y: @params.y
    @label_box.attr x: @params.x, y: @params.y, width: @params.width, height: @label_height

  setFocusable: ->
    programEvents.on('util-changed', =>
      if @focused
        @unfocus()
        @emit('unfocus')
    )
    @svg.click (e)=>
      return unless @focused
      e.stopPropagation()
      e.cancelBubble = true
      if Board.utility_name == 'select'
        @unfocus()
        @emit('unfocus')
    @uml_block.click (e)=>
      e.stopPropagation()
      e.cancelBubble = true
      if Board.utility_name == 'select' && !@focused
        @focus()
        @emit('focus')
  focus: ->
    @focused = true
    console.log('focus')
  unfocus: ->
    @focused = false
    console.log('unfocus')
  drag: ()->
    beforeDragPoint = {x: 0, y: 0}
    dragStart = =>
      beforeDragPoint.x = @params.x
      beforeDragPoint.y = @params.y

    dragHandler = (dx, dy)=>
      unless Board.utility_name == 'hand'
        return
      @params.x = beforeDragPoint.x + dx
      @params.y = beforeDragPoint.y + dy
      @redraw()
      @save()

    @uml_block.drag(dragHandler, dragStart)

  update: (params)->
    super(params)
    @redraw()
