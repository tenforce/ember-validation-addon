`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'show-result', 'Integration | Component | show result', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{show-result}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#show-result}}
      template block text
    {{/show-result}}
  """

  assert.equal @$().text().trim(), 'template block text'
