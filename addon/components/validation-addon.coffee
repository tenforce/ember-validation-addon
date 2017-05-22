`import Ember from 'ember'`
`import layout from '../templates/components/validation-addon'`

ValidationAddonComponent = Ember.Component.extend
    layout: layout
    store: Ember.inject.service()
    timeOut: 60 # default value
    data: {}
    baseURL: ""

    # whether the result table should be sorted (by default true, can be overridden)
    sortResultTable: true

    showComponent: Ember.computed 'data', 'platform', ->
        if $.isEmptyObject(@data) then false else true

    didReceiveAttrs: ->
        data = {}
        params= {
          platforms:@get('platform')
        }
        @get('store').queryRecord('validation', params ).then (res) =>
          @set "data", res
    actions:
      onConceptClick: (item) ->
        @sendAction('onConceptClick', item)



`export default ValidationAddonComponent`
