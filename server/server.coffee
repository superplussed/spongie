Meteor.publish "Classes", ->
  return Classes.find()

Meteor.publish "Modules", ->
  return Modules.find()

Meteor.publish "Components", ->
  return Components.find()

Classes.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Modules.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true

Components.allow
  insert: ->
    true
  update: ->
    true
  remove: ->
    true
