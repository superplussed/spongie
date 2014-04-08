@Module = new Meteor.Collection("Module",
  schema: new SimpleSchema(
    name:
      type: String
      label: "Name"
      max: 40
  )
)