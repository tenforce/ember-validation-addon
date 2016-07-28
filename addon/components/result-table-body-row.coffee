`import Ember from 'ember'`
`import layout from '../templates/components/result-table-body-row'`

ResultTableBodyRowComponent = Ember.Component.extend
    layout: layout
    tagName: 'tr'
    store: Ember.inject.service()
    showConcept: Ember.computed ->
        if @get('types').indexOf('concept')>=0 then true else false
    concept: Ember.computed ->
        @get('store').find('concept', @get 'item.id')

    # didReceiveAttrs: ->
    #     # if @get 'item.type' == 'concept'
    #     @get('store').find('concept', @get 'item.id').then (data)=>
    #         @set 'concept', data

`export default ResultTableBodyRowComponent`
