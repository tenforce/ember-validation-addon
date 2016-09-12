`import Ember from 'ember'`
`import layout from '../templates/components/validations-component'`

ValidationsComponentComponent = Ember.Component.extend
    layout: layout
    keys: {}
    buttonLabel: "Run all queries"
    combinedTables: false

    toggleCombinedTables : ->
        @set "combinedTables", !@get "combinedTables"
        if ((@get 'buttonLabel') == 'Back')
            $('#runQueries').addClass('btn--back')
        else
            $('#runQueries').removeClass('btn--back')

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

        url = "validations/run" + params

        $.getJSON url, (data) =>
            @runQueriesResults = data
            @set "buttonLabel", "Back"
            @toggleCombinedTables()

    actions:
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
