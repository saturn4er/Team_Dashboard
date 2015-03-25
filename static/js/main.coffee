@programEvents = new EventEmitter()
window.onload  = ->
    @programEvents.emit('load')

board = new Board('.board')
socket = io('127.0.0.1:8080');