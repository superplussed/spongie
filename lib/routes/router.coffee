Router.configure
  # notFoundTemplate: 'notFound' 
  layoutTemplate: 'defaultLayout'

Router.map ->
  @route "home",
    path: "/"
    data: 
      unjoinedClasses: ->
        Class.find().fetch()

  @route "privacy",
    path: "/privacy"

  @route "terms",
    path: "/terms"

  @route "classNew",
    path: "/class/new"

  @route "classShow",
    path: "/class/:id",
    data: ->
      class:
        Class.findOne(this.params.id)

  @route "classUpdate",
    path: "/class/update/:id",
    data: ->
      editingDoc:
        Class.findOne(this.params.id)
    
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
        Class.find().fetch()

  @route "classesCreate",
    path: "/admin/class/create"