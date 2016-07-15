`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'validation-list-view', 'Integration | Component | validation list view', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{validation-list-view}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#validation-list-view}}
      template block text
    {{/validation-list-view}}
  """

  assert.equal @$().text().trim(), 'template block text'
