Router.map ->
  @route "slideShow",
    path: "/slide/:id",
    data: ->
      slide:
        Module.findOne(@params.id)

  @route "slideUpdate",
    path: "/slide/update/:id"

    data: ->
      _id = @params.id
      _slide = Slide.findOne(@params.id)
      module: 
        Module.findOne(_slide.moduleId) if _slide
      slide:
        _slide

Template.slideUpdate.rendered = ->
  $('.wysiwyg').wysihtml5();

AutoForm.hooks
  slideForm:
    after:
      insert: (error, result, template) ->
        if error
          Alerts.add(error.message , 'info')
        else
          slide = Slide.findOne(result)
          Alerts.add("Slide '" + slide.name + "' has been created.", 'info')
          
      update: (error, result, template) ->
        if error
          Alerts.add(error.message , 'info')
        else
          Alerts.add("This slide has been updated.", 'info')