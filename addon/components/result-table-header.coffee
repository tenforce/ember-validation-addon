`import Ember from 'ember'`
`import layout from '../templates/components/result-table-header'`

ResultTableHeaderComponent = Ember.Component.extend
  layout: layout
  tagName: 'thead'

  showConcept: Ember.computed ->
      if @get('type') == 'concept' then true else false
  showMapping: Ember.computed ->
      if @get('type') == 'mapping' then true else false

`export default ResultTableHeaderComponent`
