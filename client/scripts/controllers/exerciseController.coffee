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

Template.exerciseUpdate.rendered = ->
  $('.wysiwyg').wysihtml5();

AutoForm.hooks
  exerciseForm:
    after:
      update: (error, result, template) ->
        if error
          Alerts.add(error.message , 'info')
        else
          Alerts.add("This exercise has been updated.", 'info')
      insert: (error, result, template) ->
        if error
          Alerts.add(error.message , 'info')
        else
          exercise = Exercise.findOne(result)
          Alerts.add("Exercise '" + exercise.name + "' has been created.", 'info')
