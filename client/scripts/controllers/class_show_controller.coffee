class @ClassShowController extends RouteController
  data: ->
    class:
      Class.findOne(this.params.id)
    classId: 
      this.params.id
    classModules: 
      ClassModule.find({classId: this.params.id})

  onAfterAction: ->
    Session.set("currentClassId", this.data().classId)

  onStop: ->
    Session.set("currentClassId", null)

Template.classShow.helpers
  moduleName: ->
    Module.findOne(this.moduleId)?.name

