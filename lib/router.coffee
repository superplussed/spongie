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

  @route "slideShow",
    path: "/slide/:id",
    controller: @SlideInsertController

  @route "slideUpdate",
    path: "/slide/update/:id"
    controller: @SlideUpdateController

  @route "moduleShow",
    path: "/class/:classId/module/:moduleId",
    controller: @ModuleShowController
    
  @route "admin",
    path: "/admin"
    onBeforeAction: ->
      if !Meteor.user() || !Roles.userIsInRole(Meteor.user(), ['admin'])
        @redirect('/')

  @route "adminRoles",
    path: "/admin/roles"
