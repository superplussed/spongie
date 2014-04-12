Router.map ->
  @route "classModuleShow",
    path: "/class/:classId/module/:moduleId",
    onRun: ->
      slide = Slide.findOne({moduleId: this.params.moduleId, number: 1})
      Session.set('currentSlideId', slide?._id) 
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


Template.classModuleShow.rendered = ->
  if _.isEmpty(Meteor.Keybindings._bindings)
    Meteor.Keybindings.add
      '←': (evt) -> 
        slide = Slide.prev(Session.get('currentSlideId'))
        Session.set('currentSlideId', slide._id) if slide
      '→': (evt) ->
        slide = Slide.next(Session.get('currentSlideId'))
        Session.set('currentSlideId', slide._id) if slide

Template.classModuleShow.events = 
  'click .goto-slide': ->
    Session.set('currentSlideId', this._id)

Template.classModuleShow.currentSlide = ->
  if Session.get('currentSlideId')
    Slide.findOne(Session.get('currentSlideId'))  

AutoForm.hooks
  classModuleForm:
    after:
      insert: (error, result, template) ->
        if error
          Alerts.add(error.message , 'info')
        else
          Alerts.add('This module has been added.', 'info')
        