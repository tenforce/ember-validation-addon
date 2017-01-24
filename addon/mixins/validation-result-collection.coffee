`import Ember from 'ember'`
`import DS from 'ember-data';`
`import HasManyQuery from 'ember-data-has-many-query'`

ValidationResultCollectionMixin = Ember.Mixin.create
  status: DS.attr('string')
  timestamp: DS.attr('string')
  ruleId: DS.attr('string')
  parameters: DS.attr('string-set')
  types: DS.attr('string-set')
  validationResults: DS.hasMany('validation-result', inverse: null)

`export default ValidationResultCollectionMixin`
