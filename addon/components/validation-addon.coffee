`import Ember from 'ember'`
`import layout from '../templates/components/validation-addon'`

ValidationAddonComponent = Ember.Component.extend
    layout: layout
    store: Ember.inject.service()
    data: {}

    showComponent: Ember.computed ->
        if $.isEmptyObject(@data) then false else true

    didReceiveAttrs: ->
        @set "data", @get('store').findAll('validation')

`export default ValidationAddonComponent`
