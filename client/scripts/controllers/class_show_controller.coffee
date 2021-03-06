class @ClassShowController extends RouteController
  yieldTemplates:
    'leftBarClass': {to: 'leftBarYield'}

  waitOn: ->  
    Meteor.subscribe 'Class'

  data: ->
    class:
      Class.findOne(this.params.id)
    classId: 
      this.params.id

  onAfterAction: ->
    Session.set("currentClassId", this.data().classId)

  onStop: ->
    Session.set("currentClassId", null)