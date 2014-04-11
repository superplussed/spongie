Router.configure
  notFoundTemplate: 'notFound' 
  layoutTemplate: 'defaultLayout'

Router.onBeforeAction ->
  Alerts.removeSeen()

Router.map ->
  @route "home",
    path: "/"

  @route "privacy",
    path: "/privacy"

  @route "terms",
    path: "/terms"
    
  @route "admin",
    path: "/admin"
    onBeforeAction: ->
      if !Meteor.user() || !Roles.userIsInRole(Meteor.user(), ['admin'])
        @redirect('/')

  @route "adminRoles",
    path: "/admin/roles"