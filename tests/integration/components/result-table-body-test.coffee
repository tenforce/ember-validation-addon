`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'result-table-body', 'Integration | Component | result table body', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{result-table-body}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#result-table-body}}
      template block text
    {{/result-table-body}}
  """

  assert.equal @$().text().trim(), 'template block text'
