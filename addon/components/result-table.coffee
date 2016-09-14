`import Ember from 'ember'`
`import layout from '../templates/components/result-table'`

ResultTableComponent = Ember.Component.extend
    layout: layout
    store: Ember.inject.service()
    prevLabel: "prev"
    nextLabel: "next"
    number: 0
    # params: Ember.computed 'number', ->
    #     console.log 'params'
    #
    meta: ""

    content: Ember.computed 'number', ->
        @fetchResults()

    updateCountPages: ->
      last = @get('meta.pagination.last')
      splitPageNumber
      if last
        splitPageNumber =  last.split('page[number]=')[1]
        splitLastPageNumber = splitPageNumber.split('&')[0]
        splitLastPageNumber++
        @set 'currentPages', (@get('number' ) + 1)
        @set 'totalPages', splitLastPageNumber


    fetchResults: ->
        params = {
              page: {
                  number: @get('number')
              },
              filter: {
                  'rule-id': @get('ruleid'),
                  'parameter-type': @get('type')
              }
          }
        @get('store').query('validationResult', params).then (res) =>
            @set 'meta', res.get('meta')
            @set 'content', res
            @updateCountPages()

    # return true if the included array or hash is empty
    isEmpty: Ember.computed 'content',->
        if $.isEmptyObject(@get('content')) then true else if @get('content.length') == 0 then true else false

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
