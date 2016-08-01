`import Ember from 'ember'`
`import layout from '../templates/components/result-table-header'`

ResultTableHeaderComponent = Ember.Component.extend
  layout: layout
  tagName: 'thead'

  showConcept: Ember.computed ->
      if @get('types') == 'concept' then true else false

`export default ResultTableHeaderComponent`
