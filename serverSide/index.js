// Generated by CoffeeScript 1.9.1
(function() {
  var db, server, socket_io;

  socket_io = require('socket.io');

  db = new sqlite3.Database(':memory:');

  server = socket_io(8080);

  server.on('connection', function() {
    return server.on('createElement', function(element_type, element_hash, data) {});
  });

}).call(this);

//# sourceMappingURL=index.js.map