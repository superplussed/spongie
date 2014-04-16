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
    currentSlide:
      Slide.findOne(Session.get('currentSlideId')) if Session.get('currentSlideId')

  onAfterAction: ->
    console.log "after action"
    Session.set('currentSlideId', Slide.findOne({moduleId: this.params.moduleId, number: 1})?._id) 
    Template.moduleShow.rendered = ->
      Meteor.Keybindings.add
        '←': (evt) -> 
          if slide = Slide.prev(Session.get('currentSlideId'))
            Session.set('currentSlideId', slide._id) 
        '→': (evt) ->
          if slide = Slide.next(Session.get('currentSlideId'))
            Session.set('currentSlideId', slide._id) 

  onStop: ->
    console.log "on stop"
    Meteor.Keybindings.remove(['←', '→'])

Template.moduleShow.events = 
  'click .goto-slide': ->
    Session.set('currentSlideId', this._id)
