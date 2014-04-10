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


Template.moduleShow.rendered = ->
  editor = ace.edit("aceEditor")
  editor.setTheme "ace/theme/twilight"
  editor.getSession().setMode "ace/mode/xml"
  editor.setHighlightActiveLine true
  return


Template.moduleIndex.availableModules = ->
  Module.find().fetch()

Template.moduleIndex.events =
  'click .delete-module': ->
    Module.remove(this._id)
    Alerts.add('Your module has been removed.', 'info') 

Template.moduleUpdate.events =
  'click .delete-section': ->
    Section.remove(this._id)
    Alerts.add('Your section has been removed.', 'info') 

AutoForm.hooks
  sectionForm:
    after:
      insert: (error, result, template) ->
        if error
          Alerts.add(error.message , 'info')
        else
          section = Section.findOne(result)
          Alerts.add("Section '" + section.name + "' has been created.", 'info')

  moduleForm:
    after:
      update: (error, result, template) ->
        Alerts.add('Your module has been updated.', 'info')
      insert: (error, result, template) ->
        UserModule.insert({module_id: result, user_id: Meteor.userId()})
        Alerts.add('Your module has been created.', 'info')
        Router.go("moduleUpdate", {id: result})