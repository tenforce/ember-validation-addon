`import Ember from 'ember'`
`import DS from 'ember-data';`
`import HasManyQuery from 'ember-data-has-many-query'`

ValidationResultMixin = Ember.Mixin.create
  parameterLanguage: DS.attr('string-set')
  parameterUuid: DS.attr('string')
  parameterType: DS.attr('string-set')
  parameterPreflabel: DS.attr('string-set')
  parameterLiteralForm: DS.attr('string-set')
  timestamp: DS.attr('string')
  ruleId: DS.attr('string')
  validationResultCollection: DS.belongsTo('validation-result-collection', inverse: null)

`export default ValidationResultMixin`
