`import Ember from 'ember'`
`import layout from '../templates/components/result-table-body-row'`

ResultTableBodyRowComponent = Ember.Component.extend
    layout: layout
    tagName: 'tr'
    store: Ember.inject.service()
    actions:
      onConceptClick: (item) ->
        @sendAction('onConceptClick', item)

`export default ResultTableBodyRowComponent`
