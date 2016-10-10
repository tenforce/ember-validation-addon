`import Ember from 'ember'`
`import layout from '../templates/components/show-result'`

ShowResultComponent = Ember.Component.extend
    layout: layout

    actions:
        onConceptClick: (item) ->
            @sendAction('onConceptClick', item)
        runQuery: ->
            @toggleProperty('disableButton')
            @toggleProperty('hideTable')
            false

`export default ShowResultComponent`
