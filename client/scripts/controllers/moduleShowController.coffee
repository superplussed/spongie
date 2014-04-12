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

  onBeforeAction: ->
    console.log("on after")
    
Template.moduleShow.rendered = ->
  if Template.moduleShow.currentSlide()?.html
    window.htmlEditor = new AceEditor "html"
    window.htmlEditor.update(Template.moduleShow.currentSlide().html)

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