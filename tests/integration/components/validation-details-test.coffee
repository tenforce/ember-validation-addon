`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'validation-details', 'Integration | Component | validation details', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{validation-details}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#validation-details}}
      template block text
    {{/validation-details}}
  """

  assert.equal @$().text().trim(), 'template block text'
