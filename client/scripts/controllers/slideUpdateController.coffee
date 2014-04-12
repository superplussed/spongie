class @SlideUpdateController extends RouteController

  data: ->
    _id = @params.id
    _slide = Slide.findOne(@params.id)
    module: 
      Module.findOne(_slide.moduleId) if _slide
    slide:
      _slide

  onAfterAction: ->
    Template.slideUpdate.rendered = ->
      window.cssEditor = ace.edit("ace-editor-css")
      window.cssEditor.setTheme("ace/theme/twilight")
      window.cssEditor.getSession().setMode("ace/mode/css")
      window.cssEditor.setValue(this.data.slide.css)
      window.cssEditor.getSelection().clearSelection()

      window.htmlEditor = ace.edit("ace-editor-html")
      window.htmlEditor.setTheme("ace/theme/twilight")
      window.htmlEditor.getSession().setMode("ace/mode/xml")
      window.htmlEditor.setValue(this.data.slide.html)
      window.htmlEditor.getSelection().clearSelection()

AutoForm.hooks
  slideForm:
    before:
      update: (id, slide) ->
        slide.$set.html = window.htmlEditor.getValue()
        slide.$set.css = window.cssEditor.getValue()
        slide
    after:    
      update: (error, result, template) ->
        if error
          Alerts.add(error.message , 'info')
        else
          Alerts.add("This slide has been updated.", 'info')