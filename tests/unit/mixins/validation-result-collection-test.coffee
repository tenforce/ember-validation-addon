`import Ember from 'ember'`
`import ValidationResultCollectionMixin from '../../../mixins/validation-result-collection'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | validation result collection'

# Replace this with your real tests.
test 'it works', (assert) ->
  ValidationResultCollectionObject = Ember.Object.extend ValidationResultCollectionMixin
  subject = ValidationResultCollectionObject.create()
  assert.ok subject
