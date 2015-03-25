class @UMLBlock extends EventEmitter
  constructor: (svg, ClassName, x, y, width, height, fields, methods)->
    header_height = height * 0.25;

    head = svg.rect(x, y, width, header_height)
    head.addClass('uml_block__head')
    header_size = head.getBBox();

    name = svg.text(x, y, ClassName);
    name_size = name.getBBox()
    name.attr({x: x + header_size.width / 2 - name_size.width / 2, y: y + name_size.height + header_size.height / 2 - name_size.height / 2})

    uml_block = svg.group(head, name)
    uml_block.addClass('uml_block')
    startx = undefined
    starty = undefined

    uml_block.drag()
    eve.on("snap.drag.move."+uml_block.id, ->
      console.log(uml_block.getBBox())
    )



