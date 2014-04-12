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
  # cssEditor = ace.edit("ace-editor-css")
  # cssEditor.setTheme("ace/theme/twilight")
  # cssEditor.getSession().setMode("ace/mode/css")
  # cssEditor.setHighlightActiveLine(true)

  htmlEditor = ace.edit("ace-editor-html")
  htmlEditor.setTheme("ace/theme/twilight")
  htmlEditor.getSession().setMode("ace/mode/xml")
  htmlEditor.setHighlightActiveLine(true)

AutoForm.hooks
  slideForm:
    before:
      insert: (slide) ->
        maxSlide = Slide.lastForModule(slide.moduleId)
        slide.number = if maxSlide then maxSlide.number + 1 else 1
        slide
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