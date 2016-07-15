`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'result-table', 'Integration | Component | result table', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{result-table}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#result-table}}
      template block text
    {{/result-table}}
  """

  assert.equal @$().text().trim(), 'template block text'
