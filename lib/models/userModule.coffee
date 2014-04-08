@UserModule = new Meteor.Collection("UserModule",
  schema: new SimpleSchema(
    user_id:
      type: String
      label: "User Id"
    module_id:
      type: String
      label: "Module Id"
  )
)

@UserModule.classesForUser = (id) ->
  UserModule.find({user_id: id}).fetch()

@UserModule.userHasJoined = (user_id, module_id) ->
  UserModule.find({user_id: user_id, module_id: module_id}).count() > 0