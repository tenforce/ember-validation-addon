`import Ember from 'ember'`

# This function receives the params `params, hash`
capitalizeParameterName = (params) ->
    return "parameter" + params[0][0].toUpperCase() + params[0].substr(1)

CapitalizeParameterNameHelper = Ember.Helper.helper capitalizeParameterName

`export { capitalizeParameterName }`

`export default CapitalizeParameterNameHelper`
