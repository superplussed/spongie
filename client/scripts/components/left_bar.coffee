currentClass = ->
 Class.findOne(Session.get("currentClassId"))

Template.classModuleLink.helpers
  classModuleName: ->
    Module.findOne(this.moduleId).name

Template.leftBar.helpers
  currentClassName: ->
    currentClass()?.name if Session.get("currentClassId")

  availableModules: ->
    if currentClass()
      _.map Module.find({classId: currentClass._id}).fetch(), (obj) ->
        label: obj.name
        value: obj._id



