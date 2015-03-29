#events
#  util-changed(id,name)


@programEvents = new EventEmitter()

window.onload  = ->
    @programEvents.emit('load')

try
    @socket = io('127.0.0.1:8080');
catch e
    console.log(e)


board = new Board('.board')
utils = new Utils('tools',0)

