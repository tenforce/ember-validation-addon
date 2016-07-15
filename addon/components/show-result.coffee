`import Ember from 'ember'`
`import layout from '../templates/components/show-result'`

ShowResultComponent = Ember.Component.extend
  layout: layout
  hideTable : true
  disableButton: false

  toggleDisableButton : ->
    @set "disableButton", !@get "disableButton"

  toggleHideTable : ->
    @set "hideTable", !@get "hideTable"
    @rerender()

  actions:
    runQuery: ->
      url = "validation-result/" + escape(@id)
      $.getJSON url, (data) =>
        @results = data
        @toggleDisableButton()
        @toggleHideTable()

      false


`export default ShowResultComponent`
