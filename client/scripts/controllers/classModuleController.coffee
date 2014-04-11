AutoForm.hooks
  classModuleForm:
    after:
      insert: (error, result, template) ->
        if error
          Alerts.add(error.message , 'info')
        else
          Alerts.add('This module has been added.', 'info')
        