`import Ember from 'ember'`
`import layout from '../templates/components/result-table-body'`
`import pagedArray from 'ember-cli-pagination/computed/paged-array'`

ResultTableBodyComponent = Ember.Component.extend
  layout: layout
  tagName: 'tbody'
  queryParams: ["page", "perPage"]
  page: 1
  perPage: 15

  displayPagination: Ember.computed ->
    if @included.length > @perPage then true else false

  pagedContent: pagedArray('included',{pageBinding: "page", perPageBinding: "perPage"})

  totalPagesBinding: "pagedContent.totalPages"

`export default ResultTableBodyComponent`
