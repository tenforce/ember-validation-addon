# Validation-addon

This is an ember addon for the validation microservice (`git@git.tenforce.com:mu-semtech/validation.git`), that shows the validation rules and display their results.

## Usage

Add `{{validation-addon platform="etms" onConceptClick=(action 'onConceptClick')}}` to your hbs file to use the addon.

### platform
With this parameter you can define which platform's rules you want to show. These platforms are defined [in the validation microservice's config file under the `show` property.](https://git.tenforce.com/mu-semtech/validation/blob/master/config/rules.json)

### onConceptClick
This action is called when a person clicks on a concept's id or preflabel. It bubbles up the `uuid`. Example to handle the action:

```coffeescript
`import Ember from 'ember'`

ValidationController = Ember.Controller.extend
  actions:
      onConceptClick: (item) ->
        console.log 'validation controller'
        console.log item

`export default ValidationController`

```

## Installation

`ember install git+ssh://git@git.tenforce.com:mu-semtech/validation-addon.git`
