Meteor.subscribe("classes")
Meteor.subscribe("components")
Meteor.subscribe("modules")

isAdmin = ->
  Roles.userIsInRole(Meteor.user(), ['admin'])

adminPage = ->
  IronLocation.path() == "/admin"

Handlebars.registerHelper 'userSignedIn', ->
  Meteor.user()

Handlebars.registerHelper 'isAdmin', ->
  isAdmin()

Handlebars.registerHelper 'showAdminLink', ->
  isAdmin() && !adminPage()

Handlebars.registerHelper 'username', ->
  Meteor.user()?.username
