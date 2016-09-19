`import Ember from 'ember'`

# This function receives the params `params, hash`
showCombinedResult = (params) ->
  if params[1].length == 0
    return true
  return params[0] in params[1]

ShowCombinedResultHelper = Ember.Helper.helper showCombinedResult

`export { showCombinedResult }`

`export default ShowCombinedResultHelper`
