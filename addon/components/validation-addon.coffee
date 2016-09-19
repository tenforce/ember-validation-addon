`import Ember from 'ember'`
`import layout from '../templates/components/validation-addon'`

ValidationAddonComponent = Ember.Component.extend
    layout: layout
    store: Ember.inject.service()
    data: {}

    showComponent: Ember.computed 'data', ->
        if $.isEmptyObject(@data) then false else true

    didReceiveAttrs: ->
        data = {}
        @get('store').findAll('validation').then (res) =>
          @set "data", res



`export default ValidationAddonComponent`
