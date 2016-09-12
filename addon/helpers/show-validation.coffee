`import Ember from 'ember'`

# This function receives the params `params, hash`
showValidation = (params) ->
  console.log params[0]
  console.log params[1]
  return params[1] in params[0]

ShowValidationHelper = Ember.Helper.helper showValidation

`export { showValidation }`

`export default ShowValidationHelper`
