@Modules = new Meteor.Collection("Modules",
  schema: new SimpleSchema(
    name:
      type: String
      label: "Name"
      max: 40
  )
)