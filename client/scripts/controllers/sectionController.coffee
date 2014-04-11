Router.map ->
  @route "sectionShow",
    path: "/section/:id",
    data: ->
      section:
        Module.findOne(@params.id)

  @route "sectionUpdate",
    path: "/section/update/:id"

    data: ->
      _id = @params.id
      _section = Section.findOne(@params.id)
      module: 
        Module.findOne(_section.moduleId) if _section
      section:
        _section
      exercises: 
        Exercise.find({sectionId: @params.id}).fetch()


Template.sectionUpdate.events =
  'click .delete-exercise': ->
    Exercise.remove(this._id)
    Alerts.add('Your module has been removed.', 'info') 


AutoForm.hooks
  sectionForm:
    after:
      insert: (error, result, template) ->
        if error
          Alerts.add(error.message , 'info')
        else
          section = Section.findOne(result)
          Alerts.add("Section '" + section.name + "' has been created.", 'info')
          
      update: (error, result, template) ->
        if error
          Alerts.add(error.message , 'info')
        else
          Alerts.add("This section has been updated.", 'info')