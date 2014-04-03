Books = new Meteor.Collection("modules",
  schema: new SimpleSchema(
    name:
      type: String
      label: "Name"
      max: 40
  )
)