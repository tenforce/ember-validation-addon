`import Ember from 'ember'`
`import ValidationMixin from '../../../mixins/validation'`
`import { module, test } from 'qunit'`

module 'Unit | Mixin | validation'

# Replace this with your real tests.
test 'it works', (assert) ->
  ValidationObject = Ember.Object.extend ValidationMixin
  subject = ValidationObject.create()
  assert.ok subject
