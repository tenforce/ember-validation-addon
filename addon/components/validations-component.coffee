`import Ember from 'ember'`
`import layout from '../templates/components/validations-component'`

ValidationsComponentComponent = Ember.Component.extend
    layout: layout
    keys: {}
    selectedKeys:[]
    buttonLabel: "Run all queries"
    combinedTables: false

    toggleCombinedTables : ->
        @set "combinedTables", !@get "combinedTables"
        if @get 'combinedTables'
          @set "buttonLabel", "Back"
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
        @set 'selectedKeys', []
        if keysArray.length > 0
            for key in keysArray
                if @get('keys')[key]
                  @get('selectedKeys').push(key)
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
