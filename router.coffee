Router.map ->
  @route "home",
    path: "/"

  @route "admin",
    path: "/admin"
    # onBeforeAction: ->
      # if !Roles.userIsInRole(Meteor.user(), ['admin'])
      #   @redirect('/')