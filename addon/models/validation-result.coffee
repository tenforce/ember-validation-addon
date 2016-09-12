`import DS from 'ember-data';`
`import HasManyQuery from 'ember-data-has-many-query'`

Validation =  DS.Model.extend
  language: DS.attr('string')
  uuidLabel: DS.attr('string')
  type: DS.attr('string-set')
  validationResultCollection: DS.belongsTo('validation-result-collection', {inverse: null})

`export default Validation`
