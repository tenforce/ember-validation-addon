`import Ember from 'ember'`
`import layout from '../templates/components/result-table-header'`

ResultTableHeaderComponent = Ember.Component.extend
  layout: layout
  tagName: 'thead'

  showConcept: Ember.computed ->
      if @get('types').indexOf('concept')>=0 then true else false

`export default ResultTableHeaderComponent`
