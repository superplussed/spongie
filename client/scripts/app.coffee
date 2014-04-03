Handlebars.registerHelper 'isAdmin', ->
  Roles.userIsInRole(Meteor.user(), ['admin'])