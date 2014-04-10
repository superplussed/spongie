Router.map ->
  @route "exerciseShow",
    path: "/exercise/:id",
    data: ->
      exercise:
        Module.findOne(@params.id)

  @route "exerciseUpdate",
    path: "/exercise/update/:id"

    data: ->
      _id = @params.id
      _exercise = Exercise.findOne(@params.id)
      exercise:
        _exercise
      section: 
        Section.findOne(_exercise.sectionId) if _exercise