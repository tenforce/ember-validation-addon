`import Ember from 'ember'`
`import layout from '../templates/components/validation-addon'`

ValidationAddonComponent = Ember.Component.extend
    layout: layout
    store: Ember.inject.service()
    data: {}
    timeOut: 0

    showComponent: Ember.computed 'data', 'timeOut', ->
        if $.isEmptyObject(@data) then false else if @timeOut > 0 then true else false

    didReceiveAttrs: ->
        data = {}
        timeOut = 0

        url = "validations/get_timeout"
        $.getJSON url, (data) =>
            timeOutNumber = JSON.stringify data['data']['attributes']['timeout']
            @set "timeOut" , parseInt timeOutNumber

        @set "data", @get('store').findAll('validation')



`export default ValidationAddonComponent`
