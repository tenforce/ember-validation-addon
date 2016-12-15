`import Ember from 'ember'`
`import layout from '../templates/components/show-result'`

ShowResultComponent = Ember.Component.extend
    layout: layout
    isLoading: false
    validationLoaded: false
    error: false
    store: Ember.inject.service()

    timestampListObserver: Ember.observer 'ruleid','hideTable', (->
        @fetchPreviousTimestamps()
    ).on('init')

    languageListObserver: Ember.observer 'ruleid', (->
        @set 'nextLanguage', @get 'defaultLanguage'
    ).on('ruleid')

    nextLanguage: Ember.computed ->
        @get 'defaultLanguage'

    fetchPreviousTimestamps: ->
        params = {
            filter: {
                'rule-id': @get('ruleid')
            },
            randomTimestamp: {
                'timestamp': Date.now()
            }
            }
        @get('store').query('validationResultCollection', params).then (collections) =>
            timestamps = []
            collections.forEach (collection) ->
                timestamps.push(collection.get('timestamp').replace('T', ' ').replace('Z',''))
            timestamps.sort()
            timestamps.reverse()
            @set 'previousList', timestamps
            if timestamps.length > 0
                @set 'nextTimestamp', timestamps[0]

    startValidation: ->
        @set 'isLoading', true
        @set 'validationLoaded', false
        validUrl = "/validation/" + @get('ruleid') + "/run"
        Ember.$.ajax
            type: "POST"
            url: validUrl
            data: {}
            success: (data) =>
                if data.meta.status.indexOf('A query is already running, try again later.') > -1
                    @set 'busy', true
                    @set 'isLoading', false
                else
                    @set 'timestampToCheck', data.meta.attributes.timestamp
                    @checkForResults()
            error: (error) =>
                console.log "Call to validation service failed."
                console.log (error)

    checkForResults: ->
        if @get("validationLoaded") == false
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
                            , 1000*30)
                    else
                        @set 'validationLoaded', true
                        @toggleProperty('disableButton')
                        @set 'timestamp', data.meta.attributes.timestamp
                        @set 'nextTimestamp', data.meta.attributes.timestamp
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
            @set 'language', @get('nextLanguage')
            @startValidation()
            false

        selectTimestamp: (item) ->
            @set 'nextTimestamp', item
            false
        selectLanguage: (item) ->
            @set 'nextLanguage', item
            false

        fetchPrevious: ->
            @set 'validationLoaded', true
            @set 'timestamp', @get('nextTimestamp')
            @set 'language', @get('nextLanguage')
            if @get 'hideTable'
                @toggleProperty('hideTable')
            false

`export default ShowResultComponent`
