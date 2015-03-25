fs = require('fs')

class @FileDB
  data = {}
  constructor: (@file_name, @write_timeout = 1000)->

  setWriteToFileTimeout: (@write_timeout)->
    @stopWriteToFileTimer()
    @startWriteToFileTimer()

  stopWriteToFileTimer: ->
    if @interval_id
      clearInterval(@interval_id)

  startWriteToFileTimer: ->
    @interval_id = setInterval((=> @writeToFile()), @write_timeout)

  getData: ->
    @data

  writeToFile: ->
    fs.writeFile(@file_name, JSON.stringify(data), (err)->
      if(err)
        return console.log(err);
      console.log("The file was saved!"))

