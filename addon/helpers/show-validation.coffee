`import Ember from 'ember'`

# This function receives the params `params, hash`
showValidation = (params) ->
  return params[1] in params[0]

ShowValidationHelper = Ember.Helper.helper showValidation

`export { showValidation }`

`export default ShowValidationHelper`
