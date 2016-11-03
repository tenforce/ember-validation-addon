`import Ember from 'ember'`
`import layout from '../templates/components/show-result'`

ShowResultComponent = Ember.Component.extend
    layout: layout
    isLoading: false
    store: Ember.inject.service()
    calculateMinutesLeft: (seconds) ->
      if seconds <= 60
        return 1
      return Math.round(seconds / 60)

    startValidation: ->
        @set 'isLoading', true
        validUrl = "/validation/" + @get('ruleid') + "/run"
        Ember.$.ajax
            type: "POST"
            url: validUrl
            data: {}
            success: (data) =>
                # debugger
                if data.meta.status.indexOf('The latest run was less than 30 minutes ago.') > -1
                  @set 'timestamp', data.meta.attributes.latest_run
                  @set 'nextRun', @calculateMinutesLeft(data.meta.attributes.run_again)
                  @set 'tooEarly', true
                  @set 'isLoading', false
                else if data.meta.status.indexOf('A query is already running, try again later.') > -1
                  @set 'busy', true
                  @set 'isLoading', false
                else
                  @set 'timestampToCheck', data.meta.attributes.timestamp
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
                    @set 'timestamp', data.meta.attributes.timestamp
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

        fetchPrevious: ->
            @toggleProperty('hideTable')
            false

`export default ShowResultComponent`
