`import Ember from 'ember'`
`import layout from '../templates/components/result-table'`

ResultTableComponent = Ember.Component.extend
  layout: layout
  # return true if the included array or hash is empty
  isEmpty: Ember.computed 'content.validationResults.length',->
    if $.isEmptyObject(@get('content.validationResults')) then true else if @get('content.validationResults.length') == 0 then true else false

`export default ResultTableComponent`
