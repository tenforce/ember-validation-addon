`import Ember from 'ember'`
`import layout from '../templates/components/show-result'`

ShowResultComponent = Ember.Component.extend
    layout: layout
    isLoading: false
    store: Ember.inject.service()

    startValidation: ->
        @set 'isLoading', true
        validUrl = "/validation/run?keys=" + @get('ruleid')
        Ember.$.ajax
            type: "POST"
            url: validUrl
            data: {}
            success: (data) =>
                @set 'timestampToCheck', data.meta.timestamp
                @checkForResults()
            error: (error) =>
                console.log "Call to validation service failed."
                console.log (error)

    checkForResults: ->
        timestamp = @get 'timestampToCheck'
        params = timestamp.split(' ')
        validUrl = "/validation/results?keys=" + @get('ruleid') + "&date=" + params[0] + "&time=" + params[1]
        Ember.$.ajax
            type: "GET"
            url: validUrl
            success: (data) =>
                if data.meta.status != 'finished'
                    setTimeout(
                        =>
                          @checkForResults()
                        , 1000*60)
                else
                    @toggleProperty('disableButton')
                    @set 'timestamp', data.meta.timestamp
                    @set 'isLoading', false
                    @toggleProperty('hideTable')
            error: (error) =>
                @set 'error', true
                @set 'isLoading', false
                console.log "Call to validation service failed."
                console.log (error)

    actions:
        onConceptClick: (item) ->
            @sendAction('onConceptClick', item)
        runQuery: ->
            @startValidation()
            false

`export default ShowResultComponent`
