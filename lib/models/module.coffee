@Module = new Meteor.Collection("Module",
  schema: new SimpleSchema(
    name:
      type: String
      label: "Name"
      max: 80
    creatorId:
      type: String
      label: "Creator ID"
      optional: true
  )
)