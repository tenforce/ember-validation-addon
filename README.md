# Validation-addon

This is an ember addon for the validation microservice, that shows the validation rules and displays their results. THIS VERSION OF THE ADDON WORKS WITH [THIS VERSION OF THE BACKEND](https://git.tenforce.com/mu-semtech/validation/commit/603c4c1ab388a2ff4416a9eb4b0d016715329086)!

Now if we press the run button, we can have three scenarios:

- run a query

  - nothing special, runs a query, shows the results

- a query is already running

  - something is already running, blocking another run

- fetch one of the previous result sets

  - there is a list of timestamps you can choose from if the query already ran
  - this list only appears when you have previous runs

## Usage

Add `{{validation-addon platform="translation" onConceptClick=(action 'onConceptClick') languageOptions=languageOptions defaultLanguage=defaultLanguage}}` to your hbs file to use the addon.

### platform

With this parameter you can define which platform's rules you want to show. These platforms are defined [in the validation microservice's config file under the `show` property.](https://git.tenforce.com/mu-semtech/validation/blob/master/example/rules.json)

### languageOptions and defaultLanguage

If you want to add a language filtering option, use the following format:

```
languages = [
  {title: "Bulgarian", id: "bg"}
  {title: "Croatian", id: "hr"}
  {title: "Czech", id: "cs"}
]
```

Make sure to add a default language too:
```
{title: "Bulgarian", id: "bg"}
```

### Models

To be able to use this addon, you have to use the model mixins. Generate your own ember model, and use the mixin like this:

```coffee
`import DS from 'ember-data'`
`import ValidationMixin from 'validation-addon/mixins/validation'`

Validation = DS.Model.extend ValidationMixin

`export default Validation`
```


### onConceptClick

This action is called when the user clicks on a row's id or preflabel. It bubbles up the data from the row (in ETMS/Translation the whole concept). Example to handle the action:

```coffee
`import Ember from 'ember'`

ValidationController = Ember.Controller.extend
  actions:
      @get('store').find('concept', validation.get('parameterUuid')).then (concept) =>
          if concept.get('isOccupation') then scheme = ENV.areion.occupationScheme
          # Check if switch to skill is disabled !
          else if concept.get('isSkill') then unless ENV.areion.disableTaxonomyChange then scheme = ENV.areion.skillScheme
          if scheme then @transitionToRoute('concepts.show', scheme, validation.get('parameterUuid'))

`export default ValidationController`
```

## Installation

`ember install git+ssh://git@git.tenforce.com:mu-semtech/validation-addon.git`
