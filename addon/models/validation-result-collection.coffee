`import DS from 'ember-data';`
`import HasManyQuery from 'ember-data-has-many-query'`

Validation =  DS.Model.extend
  status: DS.attr('string')
  timestamp: DS.attr('string-set')
  ruleId: DS.attr('string-set')
  parameters: DS.attr('string-set')
  types: DS.attr('string-set')
  validationResults: DS.hasMany('validation-result', inverse: null)

`export default Validation`