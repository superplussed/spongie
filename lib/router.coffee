Router.configure
  notFoundTemplate: 'notFound'
  layoutTemplate: 'defaultLayout'

Router.onBeforeAction ->
  Alerts.removeSeen()

Router.map ->
  @route "home",
    path: "/",
    controller: @HomeController

  @route "privacy",
    path: "/privacy"

  @route "terms",
    path: "/terms"

  @route "classNew",
    path: "/class/new"

  @route "classUpdate",
    path: "/class/update/:id",

  @route "classIndex",
    path: "/class",
    controller: @ClassIndexController

  @route "classShow",
    path: "/class/:id",
    controller: @ClassShowController

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

  @route "adminRoles",
    path: "/admin/roles"
