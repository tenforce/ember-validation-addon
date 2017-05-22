`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'validation-component-list', 'Integration | Component | validation component list', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{validation-component-list}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#validation-component-list}}
      template block text
    {{/validation-component-list}}
  """

  assert.equal @$().text().trim(), 'template block text'
