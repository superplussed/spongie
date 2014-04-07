Template.home.events = 
  'click .join': ->
    unless UserClass.userHasJoined(Meteor.userId(), this._id)
      UserClass.insert({class_id: this._id, user_id: Meteor.userId()})

  'click .leave': ->
    userClass = UserClass.findOne({class_id: this._id, user_id: Meteor.userId()})
    UserClass.remove(userClass._id) if userClass._id
