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

    didReceiveAttrs: ->
        @set 'content', []
        @fetchResults()

    saveResults: (res) ->
        #@set 'meta', res.get('meta')
        # @set 'content', res
        @get('content').addObjects(res)
        if @get('content.length') == 0 then @set('isEmpty', true) else @set('isEmpty', false)


    fetchResults: ->
        params = {
            page: {
                number: @get('number'),
                size: @get('size')
            },
            filter: {
                'graph': @get('graphid'),
                'rule-id': @get('ruleid')
            },
            randomTimestamp: {
                'timestamp': Date.now()
            }
        }
        @get('store').query('validationResultCollection', params).then (res) =>
            res?.get('firstObject')?.get('validationResults').then (vals) =>
                @saveResults(vals)

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
