@Components = new Meteor.Collection("Components",
  schema: new SimpleSchema(
    name:
      type: String
      label: "Name"
      max: 40
  )
)