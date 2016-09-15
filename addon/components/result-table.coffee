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
        @set 'meta', res.get('meta')
        # @set 'content', res
        @get('content').addObjects(res)


    fetchResults: ->
        params = {
            page: {
                number: @get('number'),
                size: @get('size')
            },
            filter: {
                'rule-id': @get('ruleid'),
                'parameter-type': @get('type')
            }
            }
        @get('store').query('validationResult', params).then (res) =>
            @saveResults(res)

    # return true if the included array or hash is empty
    isEmpty: Ember.computed 'content',->
        if $.isEmptyObject(@get('content')) then true else if @get('content.length') == 0 then true else false
        false

    actions:
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
