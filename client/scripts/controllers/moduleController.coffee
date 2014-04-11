Router.map ->
  @route "moduleNew",
    path: "/module/new"

  @route "moduleShow",
    path: "/module/:id",
    data: ->
      module:
        Module.findOne(this.params.id)

  @route "moduleUpdate",
    path: "/module/update/:id",
    data: ->
      module:
        Module.findOne(this.params.id)
      sections: 
        Section.find({moduleId: this.params.id}).fetch()
      slides: 
        Slide.find({moduleId: this.params.id}).fetch()


Template.moduleShow.rendered = ->
  editor = ace.edit("aceEditor")
  editor.setTheme "ace/theme/twilight"
  editor.getSession().setMode "ace/mode/xml"
  editor.setHighlightActiveLine true
  return


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
  'click .delete-section.confirmed': ->
    Section.remove(this._id)
    Alerts.add('Your section has been removed.', 'info') 
  'click .delete-slide.confirmed': ->
    Section.remove(this._id)
    Alerts.add('Your slide has been removed.', 'info') 

AutoForm.hooks
  moduleForm:
    after:
      update: (error, result, template) ->
        Alerts.add('Your module has been updated.', 'info')
      insert: (error, result, template) ->
        UserModule.insert({module_id: result, user_id: Meteor.userId()})
        Alerts.add('Your module has been created.', 'info')
        Router.go("moduleUpdate", {id: result})