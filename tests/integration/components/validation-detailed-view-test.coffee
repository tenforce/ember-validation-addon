`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'validation-detailed-view', 'Integration | Component | validation detailed view', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{validation-detailed-view}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#validation-detailed-view}}
      template block text
    {{/validation-detailed-view}}
  """

  assert.equal @$().text().trim(), 'template block text'
