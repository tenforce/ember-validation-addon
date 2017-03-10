`import Ember from 'ember'`
`import ValidationResultMixin from '../../../mixins/validation-result'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | validation result'

# Replace this with your real tests.
test 'it works', (assert) ->
  ValidationResultObject = Ember.Object.extend ValidationResultMixin
  subject = ValidationResultObject.create()
  assert.ok subject
