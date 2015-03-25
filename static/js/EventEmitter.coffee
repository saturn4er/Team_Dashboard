class @EventEmitter
  events = {}
  emit: (event)->
    unless events[event]
      return
    event_args = []
    begin = true
    for arg in arguments
      unless begin == true
        event_args.push(arg)
      else
        begin = false


    for evnt in events[event]
      evnt.apply(null, event_args)
    return

  deleteListener: (event, func)->
    unless events[event]
      return false
    index = events[event].indexOf(func)
    if index != -1
      events[event].splice(index, 1)

  on: (event, func)->
    unless typeof func is "function"
      return
    unless events[event]
      events[event] = []
    events[event].push(func)
