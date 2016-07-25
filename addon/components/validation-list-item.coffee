`import Ember from 'ember'`
`import layout from '../templates/components/validation-list-item'`

ValidationListItemComponent = Ember.Component.extend
  layout: layout
  checked: false
  notCheckedLabel: "Select"
  checkedLabel: "Selected"

  actions :
    showValidation: ->
      @sendAction("showValidation", (@get "validation"))

    setChecked: ->
      @set "checked", !@get "checked"
      @sendAction("manageKeys",(@get "checked"), (@get "validation.id"))

`export default ValidationListItemComponent`
