@Component = new Meteor.Collection("Component",
  schema: new SimpleSchema(
    name:
      type: String
      label: "Name"
      max: 40
  )
)