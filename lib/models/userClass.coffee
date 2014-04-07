@UserClass = new Meteor.Collection("UserClass",
  schema: new SimpleSchema(
    user_id:
      type: String
      label: "User Id"
    class_id:
      type: String
      label: "Class Id"
  )
)

@UserClass.classesForUser = (id) ->
  UserClass.find({user_id: id}).fetch()

@UserClass.userHasJoined = (user_id, class_id) ->
  UserClass.find({user_id: user_id, class_id: class_id}).count() > 0