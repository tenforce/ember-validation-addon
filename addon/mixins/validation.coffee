`import Ember from 'ember'`
`import Model from 'ember-data/model'`
`import attr from 'ember-data/attr'`


ValidationMixin = Ember.Mixin.create
  name: attr()
  description: attr()
  query: attr()
  parameters: attr()
  types: attr()
  show: attr()

`export default ValidationMixin`
