`import DS from 'ember-data';`
`import HasManyQuery from 'ember-data-has-many-query'`

Validation =  DS.Model.extend
  parameterLanguage: DS.attr('string-set')
  parameterUuid: DS.attr('string')
  parameterType: DS.attr('string-set')
  parameterLabelFrom: DS.attr('string')
  parameterLabelTo: DS.attr('string')
  timestamp: DS.attr('string')
  ruleId: DS.attr('string')
  validationResultCollection: DS.belongsTo('validation-result-collection', inverse: null)

`export default Validation`
