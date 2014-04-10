Router.map ->
  @route "sectionShow",
    path: "/section/:id",
    data: ->
      section:
        Module.findOne(@params.id)

  @route "sectionUpdate",
    path: "/section/update/:id",
    waitOn: ->
      Meteor.subscribe('section', @params._id)
    data: ->
      section:
        Section.findOne(@params.id)
      exercises: 
        Exercise.find({sectionId: @params.id}).fetch()