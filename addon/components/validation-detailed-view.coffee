`import Ember from 'ember'`
`import layout from '../templates/components/validation-detailed-view'`

ValidationDetailedViewComponent = Ember.Component.extend
  layout: layout
  actions:
    onConceptClick: (item) ->
      @sendAction('onConceptClick', item)

`export default ValidationDetailedViewComponent`
