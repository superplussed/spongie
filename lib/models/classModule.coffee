@ClassModule = new Meteor.Collection("ClassModule",
  schema: new SimpleSchema(
    classId:
      type: String
      label: "Class Id"
    moduleId:
      type: String
      label: "Module Id"
  )
)

@ClassModule.modulesForClass = (id) ->
  ClassModule.find({classId: id}).fetch()