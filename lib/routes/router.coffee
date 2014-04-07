Router.configure
  # notFoundTemplate: 'notFound' 
  layoutTemplate: 'defaultLayout'

Router.map ->
  @route "home",
    path: "/"
    data: 
      unjoinedClasses: ->
        Classes.find().fetch()

  @route "privacy",
    path: "/privacy"

  @route "terms",
    path: "/terms"

  @route "class",
    path: "/class/:id",
    data: ->
      class:
        Classes.findOne(this.params.id)
    
  @route "admin",
    path: "/admin"
    onBeforeAction: ->
      if !Meteor.user() || !Roles.userIsInRole(Meteor.user(), ['admin'])
        @redirect('/')

  @route "adminRoles",
    path: "/admin/roles"

  @route "classesIndex",
    path: "/admin/class"
    data: 
      classes: ->
        Classes.find().fetch()

  @route "classesCreate",
    path: "/admin/class/create"