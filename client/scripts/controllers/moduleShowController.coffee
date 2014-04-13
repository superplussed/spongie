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
    
Template.moduleShow.rendered = ->
  window.htmlEditor = new Editor "html"
  window.htmlEditor.update(Session.get('html'))
  window.htmlEditor.ace.on("change", ->
    Session.set('html', window.htmlEditor.value())
  )
  window.cssEditor = new Editor "css"
  window.cssEditor.update(Session.get('css'))
  window.cssEditor.ace.on("change", ->
    Session.set('css', window.cssEditor.value())
  )
  Template.moduleShow.resetSlide()
  if _.isEmpty(Meteor.Keybindings._bindings)
    Meteor.Keybindings.add
      '←': (evt) -> 
        if slide = Slide.prev(Session.get('currentSlideId'))
          Session.set('currentSlideId', slide._id) 
          Template.moduleShow.resetSlide()
      '→': (evt) ->
        if slide = Slide.next(Session.get('currentSlideId'))
          Session.set('currentSlideId', slide._id) 
          Template.moduleShow.resetSlide()



Template.moduleShow.events = 
  'click .goto-slide': ->
    Session.set('currentSlideId', this._id)
    Template.moduleShow.resetSlide()
  'click .tab.css': ->
    $(".tab.css").addClass("active")
    $(".tab.html").removeClass("active")
    $("#ace-editor-html").css("visibility", "hidden")
    $("#ace-editor-css").css("visibility", "auto")
  'click .tab.html': ->
    $(".tab.css").removeClass("active")
    $(".tab.html").addClass("active")
    $("#ace-editor-css").css("visibility", "hidden")
    $("#ace-editor-html").css("visibility", "auto")

Template.moduleShow.currentSlide = ->
  if Session.get('currentSlideId')
    Slide.findOne(Session.get('currentSlideId')) 

Template.moduleShow.resetSlide = ->
  slide = Template.moduleShow.currentSlide()
  Session.set('html', slide.html)
  window.htmlEditor.update(slide.html) if window.htmlEditor
  Session.set('css', slide.css)
  window.cssEditor.update(slide.css) if window.cssEditor