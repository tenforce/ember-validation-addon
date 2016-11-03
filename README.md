# Validation-addon

This is an ember addon for the validation microservice, that shows the validation rules and displays their results. THIS VERSION OF THE ADDON WORKS WITH [THIS VERSION OF THE BACKEND](https://git.tenforce.com/mu-semtech/validation/commit/1229c593f98e24ca6683d990df93cb19d7c5eca1)!

Now if we press the run button, we can have three scenarios:

- run a query
   - nothing special, runs a query, shows the results. it checks for the results every 30 mins.
- a query is already running
   - something is already running, blocking another run
- this query already ran less than 30 mins ago
   - this query already ran, you can fetch the results of the previous run or try again in a few minutes.
   - the timeout is calculated, but not a live counter

## Usage

Add `{{validation-addon platform="etms" onConceptClick=(action 'onConceptClick')}}` to your hbs file to use the addon.

### platform

With this parameter you can define which platform's rules you want to show. These platforms are defined [in the validation microservice's config file under the `show` property.](https://git.tenforce.com/mu-semtech/validation/blob/master/example/rules.json)

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
