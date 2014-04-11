Router.map ->
  @route "classNew",
    path: "/class/new"

  @route "classShow",
    path: "/class/:id",
    data: ->
      class:
        Class.findOne(this.params.id)
      classModules: 
        ClassModule.find({classId: this.params.id}).fetch()

  @route "classUpdate",
    path: "/class/update/:id",
    data: ->
      classModules: 
        ClassModule.find({classId: this.params.id}).fetch()
      editingDoc:
        Class.findOne(this.params.id)
      classId: 
        this.params.id


Template.classIndex.helpers
  availableClasses: ->
    Class.find().fetch()

Template.classUpdate.rendered = ->
  $('.wysiwyg').wysihtml5();

Template.classJoin.helpers 
  availableClasses: ->
    Class.find().fetch()
  alreadyJoined: ->
    UserClass.findOne({class_id: this._id, user_id: Meteor.userId()})
  
Template.classUpdate.helpers
  moduleName: ->
    Module.findOne(this.moduleId)?.name

Template.classShow.helpers
  moduleName: ->
    Module.findOne(this.moduleId)?.name

  availableModules: ->
    _.map Module.find().fetch(), (obj) ->
      label: obj.name
      value: obj._id

  
Template.classJoin.events =
  'click .join': ->
    unless UserClass.userHasJoined(Meteor.userId(), this._id)
      Alerts.add('You have joined a class!', 'info')
      UserClass.insert({class_id: this._id, user_id: Meteor.userId()})

Template.classUpdate.events = 
  'click .delete': ->
    ClassModule.remove(this._id)

Template.classIndex.events = 
  'click .join': ->
    unless UserClass.userHasJoined(Meteor.userId(), this._id)
      UserClass.insert({class_id: this._id, user_id: Meteor.userId()})

  'click .leave': ->
    userClass = UserClass.findOne({class_id: this._id, user_id: Meteor.userId()})
    UserClass.remove(userClass._id) if userClass._id
    
  'click .delete-class': (event) ->
    Session.set('confirmModal', 'true')
    Session.set('confirmModalMessage', 'Are you sure you want to delete this class?')
    Session.set('deleteClassId', this._id)

  'click .confirm': ->
    Alerts.add('Your class has been removed!', 'info') 
    Class.remove(Session.get('deleteClassId'))

AutoForm.hooks
  classForm:
    after:
      update: (error, result, template) ->
        Alerts.add('Your class has been updated.', 'info')
      insert: (error, result, template) ->
        UserClass.insert({class_id: result, user_id: Meteor.userId()})
        Alerts.add('Your class has been created.', 'info')
        Router.go("classUpdate", {id: result})