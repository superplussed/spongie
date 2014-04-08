@Module = new Meteor.Collection("Module",
  schema: new SimpleSchema(
    name:
      type: String
      label: "Name"
      max: 40
    creatorId:
      type: String
      label: "Creator ID"
      optional: true
  )
)