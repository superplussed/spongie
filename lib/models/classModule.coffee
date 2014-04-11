@ClassModule = new Meteor.Collection("ClassModule",
  schema: new SimpleSchema(
    class_id:
      type: String
      label: "Class Id"
    module_id:
      type: String
      label: "Module Id"
  )
)

@ClassModule.modulesForClass = (id) ->
  ClassModule.find({class_id: id}).fetch()