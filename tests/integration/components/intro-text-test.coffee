`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'intro-text', 'Integration | Component | intro text', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{intro-text}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#intro-text}}
      template block text
    {{/intro-text}}
  """

  assert.equal @$().text().trim(), 'template block text'
