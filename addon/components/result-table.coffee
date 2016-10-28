`import Ember from 'ember'`
`import layout from '../templates/components/result-table'`

ResultTableComponent = Ember.Component.extend
    layout: layout
    store: Ember.inject.service()
    number: 0
    size: 40
    # params: Ember.computed 'number', ->
    #     console.log 'params'
    #
    meta: ""
    content: []
    isLoading: true

    didReceiveAttrs: ->
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

        @get('store').query('validationResult', params).then (res) =>
            @saveResults(res)

    # return true if the included array or hash is empty
    # isEmpty: false

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
