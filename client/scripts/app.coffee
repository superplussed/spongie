Meteor.subscribe("Class")
Meteor.subscribe("Component")
Meteor.subscribe("Module")
Meteor.subscribe("UserClass")

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

Handlebars.registerHelper 'currentUserId', ->
  Meteor.user()?._id

Handlebars.registerHelper 'createdByMe', ->
  this.creatorId == Meteor.user()?._id

Handlebars.registerHelper 'joinedClass', ->
  UserClass.userHasJoined(Meteor.userId(), this._id)