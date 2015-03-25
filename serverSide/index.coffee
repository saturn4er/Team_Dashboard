socket_io = require('socket.io')
db = new sqlite3.Database(':memory:');
server = socket_io(8080)
server.on('connection', ->
  server.on('createElement', (element_type, element_hash, data)->

  )
)