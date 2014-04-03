isAdmin = ->
  Roles.userIsInRole(Meteor.user(), ['admin'])

adminPage = ->
  IronLocation.path() == "/admin"

Handlebars.registerHelper 'isAdmin', ->
  isAdmin()

Handlebars.registerHelper 'showAdminLink', ->
  isAdmin() && !adminPage()