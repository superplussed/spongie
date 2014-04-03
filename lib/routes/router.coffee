Router.configure
  notFoundTemplate: 'notFound' 
  layoutTemplate: 'defaultLayout'

Router.map ->
  @route "home",
    path: "/"

  @route "admin",
    path: "/admin"
    onBeforeAction: ->
      if !Meteor.user() || !Roles.userIsInRole(Meteor.user(), ['admin'])
        @redirect('/')

  @route "adminRoles",
    path: "/admin/roles"