`import Model from 'ember-data/model'`
`import attr from 'ember-data/attr'`

ValidationModel = Model.extend
  name: attr()
  description: attr()
  query: attr()
  parameters: attr()
  types: attr()
  show: attr()

`export default ValidationModel`
