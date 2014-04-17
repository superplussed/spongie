Meteor.publish null, ->
  fields = myCustomField: 1
  Meteor.users.find {},
    fields: fields

Meteor.publish "Class", ->
  return Class.find()

Meteor.publish "Module", ->
  return Module.find()

Meteor.publish "UserClass", ->
  return UserClass.find()

Meteor.publish "UserModule", ->
  return UserModule.find()

Meteor.publish "ClassModule", ->
  return ClassModule.find()

Meteor.publish "Slide", ->
  return Slide.find()


Slide.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Class.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

ClassModule.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

UserClass.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

UserModule.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Module.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true
