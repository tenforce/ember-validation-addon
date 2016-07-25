`import Ember from 'ember'`
`import layout from '../templates/components/validations-component'`

ValidationsComponentComponent = Ember.Component.extend
    layout: layout
    keys: {}
    buttonLabel: "Run all queries"
    combinedTables: false
    cache: true
    cacheLabel: "Using cache"

    toggleCombinedTables : ->
        @set "combinedTables", !@get "combinedTables"

    toggleButtonLabel: ->
        keysArray = Object.keys(@keys)

        if keysArray.length > 0
            for key in keysArray
                if @keys[key]
                    @set "buttonLabel", "Run selected queries"
                    return

        @set "buttonLabel", "Run all queries"

    runQueries: ->
        keysArray = Object.keys(@keys)
        params = ""
        if keysArray.length > 0
            params = "?keys="
            for key in keysArray
                if @keys[key]
                    params=params.concat(escape(key) + ",")

        params = params.substring(0, params.length - 1);

        unless @cache
            if params.length > 0
                params +="&no_cache="
            else
                params +="?no_cache="

        url = "validations/run" + params

        $.getJSON url, (data) =>
            @runQueriesResults = data
            @set "buttonLabel", "Back"
            @toggleCombinedTables()

    actions:
        setTimeOut : (timeOut)->
            timeOut = parseInt timeOut
            if timeOut > 24
                @set "timeOut", 24
            else if timeOut < 1
                @set "timeOut", 1
            else
                @set "timeOut", timeOut

        saveTimeOut : ->
            timeOut = @get "timeOut"
            $.ajax 'validations/set_timeout',
                type: 'POST'
                dataType: 'json'
                contentType: "application/json; charset=utf-8"
                data: JSON.stringify({ time: timeOut })
                success: (data) ->
                    # console.log data

        toggleCache : ->
            @set "cache", !@get "cache"

            if @get "cache"
                @set "cacheLabel", "Using cache"
            else
                @set "cacheLabel", "Not using cache"


        showValidation: (validation) ->
            @set "validation-to-show", validation
            false

        manageKeys: (isSelected, key) ->
            @keys[key] = isSelected
            @toggleButtonLabel()
            false

        runSelectedQueries: ->
            unless @combinedTables
                @runQueries()

            else
                @set "keys", {}
                @set "runQueriesResults", {}
                @set "validation-to-show", null
                @toggleButtonLabel()
                @toggleCombinedTables()

            false

`export default ValidationsComponentComponent`
