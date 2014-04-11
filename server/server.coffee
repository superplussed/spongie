Meteor.publish "Class", ->
  return Class.find()

Meteor.publish "Module", ->
  return Module.find()

Meteor.publish "Component", ->
  return Component.find()

Meteor.publish "UserClass", ->
  return UserClass.find()

Meteor.publish "UserModule", ->
  return UserModule.find()

Meteor.publish "Section", ->
  return Section.find()

Meteor.publish "Exercise", ->
  return Exercise.find()

Meteor.publish "ClassModule", ->
  return ClassModule.find()

Meteor.publish "Slide", ->
  return Slide.find()


Exercise.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

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

Component.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Section.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true
