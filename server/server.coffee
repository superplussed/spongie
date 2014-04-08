Meteor.publish "Class", ->
  return Class.find()

Meteor.publish "Module", ->
  return Module.find()

Meteor.publish "Component", ->
  return Component.find()

Meteor.publish "UserClass", ->
  return UserClass.find()

Class.allow
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
