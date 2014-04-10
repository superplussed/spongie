Router.map ->
  @route "sectionShow",
    path: "/section/:id",
    data: ->
      section:
        Module.findOne(@params.id)

  @route "sectionUpdate",
    path: "/section/update/:id"
    # waitOn:

    data: ->
      _id = @params.id
      _section = Section.findOne(@params.id)
      module: 
        Module.findOne(_section.moduleId) if _section
      section:
        _section
      exercises: 
        Exercise.find({sectionId: @params.id}).fetch()
