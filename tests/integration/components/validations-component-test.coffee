`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'validations-component', 'Integration | Component | validations component', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{validations-component}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#validations-component}}
      template block text
    {{/validations-component}}
  """

  assert.equal @$().text().trim(), 'template block text'
