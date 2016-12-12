`import Ember from 'ember'`
`import layout from '../templates/components/result-table'`

ResultTableComponent = Ember.Component.extend
    layout: layout
    store: Ember.inject.service()
    number: 0
    size: 40
    meta: ""
    content: []
    isLoading: true

    timestampListObserver: Ember.observer 'timestamp', (->
        @resetTable()
    ).on('init')

    selectedLanguageListObserver: Ember.observer 'selectedLanguage', (->
        @resetTable()
    ).on('selectedLanguage')

    resetTable: ->
        @set 'content', []
        @fetchResults()

    saveResults: (res) ->
        @set 'meta', res.get('meta')
        @get('content').addObjects(res)
        if @get('content.length') == 0 then @set('isEmpty', true) else @set('isEmpty', false)
        @set 'isLoading', false


    fetchResults: ->
        params = {
            page: {
                number: @get('number'),
                size: @get('size')
            },
            filter: {
                'rule-id': @get('ruleid'),
                'parameter-type': @get('type')
                'timestamp': @get('timestamp')
            },
            randomTimestamp: {
                'timestamp': Date.now()
            }
            }
        if @get 'selectedLanguage'
            unless @get('selectedLanguage.id') is 'all-languages'
                params['filter']['parameter-language'] = @get 'selectedLanguage.id'

        @get('store').query('validationResult', params).then (res) =>
            @saveResults(res)

    actions:
        onConceptClick: (item) ->
            @sendAction('onConceptClick', item)
        previousPage: ->
            newNumber = @get('number') - 1
            @set 'number', newNumber
            @fetchResults()
            false
        nextPage: ->
            newNumber = @get('number') + 1
            @set 'number', newNumber
            @fetchResults()
            false

`export default ResultTableComponent`
