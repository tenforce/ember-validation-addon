`import Ember from 'ember'`
`import layout from '../templates/components/validation-addon'`

ValidationAddonComponent = Ember.Component.extend
    layout: layout
    store: Ember.inject.service()
    data: {}
    timeOut: 24

    showComponent: Ember.computed ->
        if $.isEmptyObject(@data) then false else true

    didReceiveAttrs: ->
        @set "data", @get('store').findAll('validation')

        url = "validations/get_timeout"

        $.getJSON url, (data) =>
            @set "timeOut" , data


`export default ValidationAddonComponent`
