class @Utils
  @utilsDOM = undefined
  @selectedID = 0
  constructor: (utils_class, @selectedID=0)->
    @utilsDOM = document.getElementsByClassName(utils_class)
    @bindListeners()
    @updateClasses()

  bindListeners: ->
    for dom in @utilsDOM
      children = dom.children
      for child,i in children
        do (i) =>
          child.addEventListener('click', => @changeUtil i)
    return

  changeUtil: (i)->
    @selectedID = i
    @updateClasses()


  updateClasses: ->
    for dom in @utilsDOM
      children = dom.children
      for child,i in children
        if i == @selectedID
          child.classList.add('selected')
          programEvents.emit('util-changed', @selectedID, child.attributes['data-type'].nodeValue)
        else
          child.classList.remove('selected')
    return

