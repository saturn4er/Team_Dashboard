uml_block_class = 'uml_block'
class @DefaultElement extends EventEmitter
  constructor: (@board, @block_type, @params, @hash)->
    unless @hash
      @hash = Math.random().toString(36).substr(2, 15)
    @save()

  get_hash: ->
    @hash

  redraw: ->
    @emit('redraw')

  save: ->
    @emit('beforeSave')
    socket.emit('saveElement', @hash,
      {
        type: @block_type,
        params: @params
      })

  update: (params)->
    for key,val in params
      @params[key] = val
    @redraw()


