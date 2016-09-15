`import Ember from 'ember'`
`import layout from '../templates/components/show-result'`

ShowResultComponent = Ember.Component.extend
    layout: layout
    store: Ember.inject.service()
    tableContent: ""

    actions:
        runQuery: ->
            @get('store').query('validationResultCollection', 'filter[rule-id]': @get('id')).then (validationCollection) =>
              @set 'tableContent', validationCollection
              @toggleProperty('disableButton')
              @toggleProperty('hideTable')
            false

`export default ShowResultComponent`
