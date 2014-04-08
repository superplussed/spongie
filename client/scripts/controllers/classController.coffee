Template.classIndex.events = 
  'click .join': ->
    unless UserClass.userHasJoined(Meteor.userId(), this._id)
      UserClass.insert({class_id: this._id, user_id: Meteor.userId()})

  'click .leave': ->
    userClass = UserClass.findOne({class_id: this._id, user_id: Meteor.userId()})
    UserClass.remove(userClass._id) if userClass._id

  'click .delete-class': ->
    Class.remove(this._id)


Template.classNew.rendered = ->
  $('.wysiwyg').wysihtml5()


Template.classUpdate.rendered = ->
  $('.wysiwyg').wysihtml5()


AutoForm.hooks
  classNewForm:
    after:
      insert: (error, result, template) ->
        UserClass.insert({class_id: result, user_id: Meteor.userId()})
        Router.go("classUpdate", {id: result})