socket_io = require('socket.io')
db = require('./FileDB.js')
file_db = new db('test', 2000)
server = socket_io(8080)
connection_color_letters = "123456789ABCDEF"
server.on('connection', (socket)->
  connection_color = '#'
  for i in [0..6]
    connection_color+= connection_color_letters[Math.floor(Math.random()*connection_color_letters.length)]
  console.log(connection_color)
  socket.on('saveElement', (hash, data)->
    server.emit('updateElement',connection_color, hash, data)
  )
)