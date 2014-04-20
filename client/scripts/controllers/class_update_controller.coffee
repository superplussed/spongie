class @ClassUpdateController extends RouteController
  data: ->
    classModules: 
      ClassModule.find({classId: this.params.id}).fetch()
    editingDoc:
      Class.findOne(this.params.id)
    classId: 
      this.params.id

Template.classUpdate.rendered = ->
  $('.wysiwyg').wysihtml5();

Template.classUpdate.events = 
  'click .delete': ->
    ClassModule.remove(this._id)

Template.classUpdate.helpers
  moduleName: ->
    Module.findOne(this.moduleId)?.name

AutoForm.hooks
  classForm:
    after:
      update: (error, result, template) ->
        Alerts.add('Your class has been updated.', 'info')
      insert: (error, result, template) ->
        UserClass.insert({class_id: result, user_id: Meteor.userId()})
        Alerts.add('Your class has been created.', 'info')
        Router.go("classUpdate", {id: result})