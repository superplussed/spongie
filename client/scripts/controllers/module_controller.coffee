Router.map ->
  @route "moduleNew",
    path: "/module/new"

  @route "moduleUpdate",
    path: "/module/update/:id",
    data: ->
      module:
        Module.findOne(this.params.id)
      slides: 
        Slide.find({moduleId: this.params.id}, {sort: {number: 1}}).fetch()


Template.moduleIndex.availableModules = ->
  Module.find().fetch()

Template.moduleIndex.events =
  'click .confirm': ->
    Module.remove(Session.get("deleteModuleId"))
    Alerts.add('Your module has been removed.', 'info') 
  
  'click .delete-module': (event) ->
    Session.set('confirmModal', 'true')
    Session.set('confirmModalMessage', 'Are you sure you want to delete this module?')
    Session.set('deleteModuleId', this._id)

Template.moduleUpdate.events =
  'click .delete-slide': (event) ->
    Slide.remove(this._id)
    Alerts.add('Your slide has been removed.', 'info')


AutoForm.hooks
  classModuleForm:
    after:
      insert: (error, result, template) ->
        if error
          Alerts.add(error.message , 'info')
        else
          Alerts.add('This module has been added.', 'info')
        
AutoForm.hooks
  moduleForm:
    after:
      update: (error, result, template) ->
        Alerts.add('Your module has been updated.', 'info')
      insert: (error, result, template) ->
        UserModule.insert({module_id: result, user_id: Meteor.userId()})
        Alerts.add('Your module has been created.', 'info')
        Router.go("moduleUpdate", {id: result})