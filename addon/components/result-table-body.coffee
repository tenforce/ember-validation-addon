`import Ember from 'ember'`
`import layout from '../templates/components/result-table-body'`

ResultTableBodyComponent = Ember.Component.extend
    layout: layout
    tagName: 'tbody'
    actions:
      onConceptClick: (item) ->
        @sendAction('onConceptClick', item)


`export default ResultTableBodyComponent`
