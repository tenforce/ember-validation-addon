`import Ember from 'ember'`
`import layout from '../templates/components/result-table'`

ResultTableComponent = Ember.Component.extend
    layout: layout
    store: Ember.inject.service()
    page: {
        number: 0
    }
    params: Ember.computed 'page', 'page.number', ->
        {
            page: @get('page'),
            filter: {
                'rule-id': @get('id'),
                'parameter-type': @get('type')
            }
        }
    meta: ""
    content: Ember.computed  'page', 'page.number', ->
        @get('store').query('validationResult', @get('params')).then (res) =>
            @set 'meta', res.get('meta')
            @set 'content', res

    # return true if the included array or hash is empty
    isEmpty: Ember.computed 'content.length',->
        if $.isEmptyObject(@get('content')) then true else if @get('content.length') == 0 then true else false

`export default ResultTableComponent`
