`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'validation-component-dropdown', 'Integration | Component | validation component dropdown', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{validation-component-dropdown}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#validation-component-dropdown}}
      template block text
    {{/validation-component-dropdown}}
  """

  assert.equal @$().text().trim(), 'template block text'
