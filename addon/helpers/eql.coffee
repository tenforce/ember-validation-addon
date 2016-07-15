`import Ember from 'ember'`

# This function receives the params `params, hash`
eql = (params) ->
  return params[0] == params[1]

EqlHelper = Ember.Helper.helper eql

`export { eql }`

`export default EqlHelper`
