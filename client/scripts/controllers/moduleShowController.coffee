class @ModuleShowController extends RouteController

  data: ->
    class:
      Class.findOne(this.params.classId)
    classId:
      this.params.classId
    module:
      Module.findOne(this.params.moduleId)
    moduleId:
      this.params.moduleId
    slides:
      Slide.find({moduleId: this.params.moduleId}, {sort: {number: 1}})

  onRun: ->
    slide = Slide.findOne({moduleId: this.params.moduleId, number: 1})
    Session.set('currentSlideId', slide?._id) 

  onAfterAction: ->
    Template.moduleShow.rendered = ->
      # window.cssEditor = ace.edit("ace-editor-css")
      # window.cssEditor.setTheme("ace/theme/twilight")
      # window.cssEditor.getSession().setMode("ace/mode/css")
      # window.cssEditor.setValue(this.data.slide.css)
      # window.cssEditor.getSelection().clearSelection()
      if Template.moduleShow.currentSlide()?.html
        window.htmlEditor = ace.edit("ace-editor-html")
        window.htmlEditor.setTheme("ace/theme/twilight")
        window.htmlEditor.getSession().setMode("ace/mode/xml")
        window.htmlEditor.setValue(Template.moduleShow.currentSlide().html)
        window.htmlEditor.getSelection().clearSelection()

      if _.isEmpty(Meteor.Keybindings._bindings)
        Meteor.Keybindings.add
          '←': (evt) -> 
            slide = Slide.prev(Session.get('currentSlideId'))
            Session.set('currentSlideId', slide._id) if slide
          '→': (evt) ->
            slide = Slide.next(Session.get('currentSlideId'))
            Session.set('currentSlideId', slide._id) if slide
 

Template.moduleShow.events = 
  'click .goto-slide': ->
    Session.set('currentSlideId', this._id)

Template.moduleShow.currentSlide = ->
  if Session.get('currentSlideId')
    Slide.findOne(Session.get('currentSlideId')) 