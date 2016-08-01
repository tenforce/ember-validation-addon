`import Ember from 'ember'`
`import layout from '../templates/components/result-table'`

ResultTableComponent = Ember.Component.extend
  layout: layout
  # return true if the included array or hash is empty
  isEmpty: Ember.computed ->
    if $.isEmptyObject(@types) then true else if $.isEmptyObject(@included) then true else if @get('included.length') == 0 then true else false

`export default ResultTableComponent`
