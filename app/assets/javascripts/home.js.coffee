debounceQueue = null

debounce = (fn, id) ->
  debounceQueue = id if debounceQueue == null
  clearTimeout timer if id == debounceQueue
  timer = setTimeout ->
    fn()
    debounceQueue = null
  , 1000
