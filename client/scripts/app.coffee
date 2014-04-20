Deps.autorun ->
  Meteor.subscribe "users"

Meteor.subscribe "Class"
Meteor.subscribe "ClassModule"
Meteor.subscribe "Module"
Meteor.subscribe "UserClass"
Meteor.subscribe "UserModule"
Meteor.subscribe "Slide"

Helpers.addScope 'Session', Session
Helpers.addScope 'Meteor', Meteor

isAdmin = ->
  Roles.userIsInRole(Meteor.user(), ['admin'])

adminPage = ->
  IronLocation.path() == "/admin"

Handlebars.registerHelper 'userSignedIn', ->
  Meteor.user()

Handlebars.registerHelper 'isAdmin', ->
  isAdmin()

Handlebars.registerHelper 'className', ->
  Class.findOne(Session.get("currentClassId")).name

Handlebars.registerHelper 'moduleName', ->
  Module.findOne(Session.get("currentModuleId")).name

Handlebars.registerHelper 'showAdminLink', ->
  isAdmin() && !adminPage()

Handlebars.registerHelper 'username', ->
  Meteor.user()?.username

Handlebars.registerHelper 'classModules', -> 
  ClassModule.find({classId: Session.get 'currentClassId'})

Handlebars.registerHelper 'currentUserId', ->
  Meteor.user()?._id

Handlebars.registerHelper 'currentSlide', ->
  Slide.findOne(Session.get("currentSlideId"))

Handlebars.registerHelper 'createdByMe', ->
  this.creatorId == Meteor.user()?._id

Handlebars.registerHelper 'joinedClass', ->
  UserClass.userHasJoined(Meteor.userId(), this._id)