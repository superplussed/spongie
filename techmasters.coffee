Handlebars.registerHelper 'isAdmin', ->
  Roles.userIsInRole(Meteor.user(), ['admin'])

Meteor.methods
  isAdminUser: ->
    return true
