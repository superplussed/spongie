class @ClassShowController extends RouteController
  data: ->
    class:
      Class.findOne(this.params.id)
    classModules: 
      ClassModule.find({classId: this.params.id}).fetch()

Template.classShow.helpers
  moduleName: ->
    Module.findOne(this.moduleId)?.name

  availableModules: ->
    _.map Module.find().fetch(), (obj) ->
      label: obj.name
      value: obj._id