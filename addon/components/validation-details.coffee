`import Ember from 'ember'`
`import layout from '../templates/components/validation-details'`

ValidationDetailsComponent = Ember.Component.extend
  layout: layout
  parameterArrayEmpty: Ember.computed.empty('parameters')
  typesArrayEmpty: Ember.computed.empty('types')

`export default ValidationDetailsComponent`
