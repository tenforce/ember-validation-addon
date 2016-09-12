`import Ember from 'ember'`
`import layout from '../templates/components/show-result'`

ShowResultComponent = Ember.Component.extend
    layout: layout
    hideTable : true
    disableButton: false
    separatedIncluded: {}

    didReceiveAttrs: ->
        @set "disableButton", false
        @set "hideTable", true

    toggleDisableButton : ->
        @set "disableButton", !@get "disableButton"

    toggleHideTable : ->
        @set "hideTable", !@get "hideTable"
        @rerender()

    separateTypes: ->
      for type in @get('results.data.attributes.types')
          @get('separatedIncluded')[type] = []

      for item in @get('results.included')
        if @get('separatedIncluded')[item.type]
          @get('separatedIncluded')[item.type].pushObject(item)

    actions:
        runQuery: ->
            url = "/validations/validation-result/" + escape(@id)

            $.getJSON url, (data) =>
                @set 'results', data
                @separateTypes()
                @toggleDisableButton()
                @toggleHideTable()

            false

`export default ShowResultComponent`
