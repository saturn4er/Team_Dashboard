uml_block_class = 'uml_block'
class @UMLBlock extends DefaultElement
  constructor: (@svg, @ClassName, @x, @y, @width, @fields, @methods, @hash)->
    unless @hash
      @hash = Math.random().toString(36).substr(2, 15)
    @label_box_height = 25;
    @field_box_height = 25;
    @method_box_height = 25;
    @min_container_width = 100;
    @width = @min_container_width if @width < @min_container_width
    @save()

    container_height = @calc_container_height()
    @container = @svg.rect(@x, @y, @width, container_height, 20)
    @container.addClass(uml_block_class + '__container')

    label_box = @add_label_box()


    @uml_block = @svg.group(@container, label_box)
    @uml_block.addClass('uml_block')

    beforeDragPoint = {x:0, y:0}

    dragStart = (x,y)=>
      beforeDragPoint.x = @x
      beforeDragPoint.y = @y

    dragHandler = (dx, dy)=>
      if Board.utility == 1
        @x = beforeDragPoint.x + dx
        @y = beforeDragPoint.y + dy
        @save()

    @uml_block.drag()

#    right_resizing = false
#    @uml_block.mousemove((e,x,y)=>
#      @uml_block.addClass('available_resize')
#      if( x > @x+@width-5 && x<=@x+@width && y>@y && y<@y+container_height)
#        @uml_block.mousedown =>
#          right_resizing = true
#          @uml_block.undrag()
#        @uml_block.mouseup =>
#          right_resizing = false
#          @uml_block.drag()
#      else
#
#        @uml_block.removeClass('available_resize')
#        @uml_block.unmouseup()
#        @uml_block.unmousedown()
#    )

  get_hash: ->
    @hash
  calc_container_height: ->
    fields_height = Object.keys(@fields).length * @field_box_height
    methods_height = Object.keys(@methods).length * @method_box_height
    return @label_box_height + fields_height + methods_height

  add_label_box: ()->
    @label = @svg.text(@x, @y, @ClassName)
    @label.addClass('uml_block__label')
    @recalculate_label_box()

    @label_divider = @svg.line(@x, @y + @label_box_height, @x + @width, @y + @label_box_height)
    @label_divider.addClass('uml_block__separator')
    @svg.group(@label_divider, @label)

  recalculate_container: ->
    @container.attr(
      x: @x,
      y: @y,
      width: @width,
      height: @calc_container_height()
    )
  recalculate_label_box: ->
    container_size = @container.getBBox()
    label_size = @label.getBBox()
    @label.attr({
      x: @x + container_size.width / 2 - label_size.width / 2,
      y: @y + label_size.height + @label_box_height / 2 - label_size.height / 2
    })
  recalculate_label_separator: ->
    @label_divider.attr({
      x1: @x,
      y1: @y + @label_box_height,
      x2: @x + @width,
      y2: @y + @label_box_height
    })
  save: ->
    socket.emit('saveElement', @hash,
      {
        type: 'uml_block',
        params: {
          name: @ClassName,
          x: @x, y: @y,
          width: @width,
          fields: @fields,
          methods: @methods
        }
      })
  recalculate_positions: ->
    @recalculate_container()
    @recalculate_label_box()
    @recalculate_label_separator()
  update: (params)->
    @x = params.x
    @y = params.y
    @width = params.width
    @fields = params.fields
    @methods = params.methods
    @recalculate_positions()


