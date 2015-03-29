#events
#  util-changed(id,name)


@programEvents = new EventEmitter()

window.onload  = ->
    @programEvents.emit('load')

@socket = io('127.0.0.1:8080');
board = new Board('.board')
utils = new Utils('tools',1)