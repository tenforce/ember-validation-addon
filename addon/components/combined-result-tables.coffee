`import Ember from 'ember'`
`import layout from '../templates/components/combined-result-tables'`

CombinedResultTablesComponent = Ember.Component.extend
  layout: layout

  createKeyArreys: ->
    # we create a different keyHash for each key that appears in the relationships
    if @relationships
      for relation in @relationships
        @includedHash[relation.id] = {}
  actions:
    onConceptClick: (item) ->
      @sendAction('onConceptClick', item)

`export default CombinedResultTablesComponent`
