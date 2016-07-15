`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'combined-result-tables', 'Integration | Component | combined result tables', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{combined-result-tables}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#combined-result-tables}}
      template block text
    {{/combined-result-tables}}
  """

  assert.equal @$().text().trim(), 'template block text'
