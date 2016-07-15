`import Ember from 'ember'`
`import layout from '../templates/components/validation-list-view'`

ValidationListViewComponent = Ember.Component.extend
  layout: layout
  actions:
    showValidation: (validation) ->
      @sendAction("showValidation", validation)

    manageKeys: (isSelected, key) ->
      @sendAction("manageKeys",isSelected, key)

`export default ValidationListViewComponent`
