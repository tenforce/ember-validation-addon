`import Ember from 'ember'`
`import layout from '../templates/components/result-table-body-row'`

ResultTableBodyRowComponent = Ember.Component.extend
    layout: layout
    tagName: 'tr'
    store: Ember.inject.service()
    showConcept: Ember.computed ->
        if @get('type') == 'concept' then true else false
    showMapping: Ember.computed ->
        if @get('type') == 'mapping' then true else false
    concept: Ember.computed ->
        @get('store').find('concept', @get 'item.parameterUuid')

    mapping: Ember.computed ->
      @get('store').find('concept', @get 'item.parameterUuid')

    actions:
      onConceptClick: (item) ->
        @sendAction('onConceptClick', item)

`export default ResultTableBodyRowComponent`
