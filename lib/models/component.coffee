Books = new Meteor.Collection("components",
  schema: new SimpleSchema(
    name:
      type: String
      label: "Name"
      max: 40
  )
)