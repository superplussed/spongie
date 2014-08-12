class @ClassIndexController extends RouteController
  data: ->
    class:
      Class.findOne(this.params.id)
    classModules: 
      ClassModule.find({classId: this.params.id})

Template.classIndex.helpers
  availableClasses: ->
    Class.find().fetch()


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


