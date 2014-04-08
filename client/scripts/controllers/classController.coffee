Router.map ->
  @route "classNew",
    path: "/class/new"

  @route "classShow",
    path: "/class/:id",
    data: ->
      class:
        Class.findOne(this.params.id)

  @route "classUpdate",
    path: "/class/update/:id",
    data: ->
      editingDoc:
        Class.findOne(this.params.id)


Template.classIndex.availableClasses = ->
  Class.find().fetch()
  

Template.classIndex.events = 
  'click .join': ->
    unless UserClass.userHasJoined(Meteor.userId(), this._id)
      UserClass.insert({class_id: this._id, user_id: Meteor.userId()})

  'click .leave': ->
    userClass = UserClass.findOne({class_id: this._id, user_id: Meteor.userId()})
    UserClass.remove(userClass._id) if userClass._id

  'click .delete-class': ->
    Class.remove(this._id)
    Alerts.add('Your class has been removed!', 'info') 


Template.classNew.rendered = ->
  $('.wysiwyg').wysihtml5()


Template.classUpdate.rendered = ->
  $('.wysiwyg').wysihtml5()


AutoForm.hooks
  classForm:
    after:
      update: (error, result, template) ->
        Alerts.add('Your class has been updated.', 'info')
      insert: (error, result, template) ->
        UserClass.insert({class_id: result, user_id: Meteor.userId()})
        Alerts.add('Your class has been created.', 'info')
        Router.go("classUpdate", {id: result})