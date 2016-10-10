`import Ember from 'ember'`
`import layout from '../templates/components/combined-result-tables'`

CombinedResultTablesComponent = Ember.Component.extend
  layout: layout
  # includedHash: {}
  # relationshipsHash: {}
  #
  # didReceiveAttrs: ->
  #   @set "includedHash", {}
  #   @set "relationshipsHash", {}
  #   @createKeyArreys()
  #   # we check each item, if they have a ruleKey parameter
  #   # we put it in the ruleKey's hash
  #   if @included
  #     for item in @included
  #       if item.attributes
  #         ruleKey = item.attributes.ruleKey
  #         id = item.id
  #         if ruleKey
  #           type = item.type
  #           unless @includedHash[ruleKey][type]
  #             @includedHash[ruleKey][type] = []
  #           @includedHash[ruleKey][type].push(item)
  #           # @includedHash[ruleKey].push(item)
  #         else
  #           @relationshipsHash[id] = item

  createKeyArreys: ->
    # we create a different keyHash for each key that appears in the relationships
    if @relationships
      for relation in @relationships
        @includedHash[relation.id] = {}
  actions:
    onConceptClick: (item) ->
      @sendAction('onConceptClick', item)

`export default CombinedResultTablesComponent`
