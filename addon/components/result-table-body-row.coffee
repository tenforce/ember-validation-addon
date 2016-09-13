`import Ember from 'ember'`
`import layout from '../templates/components/result-table-body-row'`

ResultTableBodyRowComponent = Ember.Component.extend
    layout: layout
    tagName: 'tr'
    store: Ember.inject.service()
    showConcept: Ember.computed ->
        if @get('type') == 'concept' then true else false
    concept: Ember.computed ->
        @get('store').find('concept', @get 'item.parameterUuid')


`export default ResultTableBodyRowComponent`
