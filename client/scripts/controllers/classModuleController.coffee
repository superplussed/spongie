Router.map ->
  @route "classModuleShow",
    path: "/class/:classId/module/:moduleId",
    data: ->
      class:
        Class.findOne(this.params.classId)
      classId:
        this.params.classId
      module:
        Module.findOne(this.params.moduleId)
      moduleId:
        this.params.moduleId

AutoForm.hooks
  classModuleForm:
    after:
      insert: (error, result, template) ->
        if error
          Alerts.add(error.message , 'info')
        else
          Alerts.add('This module has been added.', 'info')
        