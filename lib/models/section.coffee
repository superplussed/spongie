@Section = new Meteor.Collection("Section",
  schema: new SimpleSchema(
    name:
      type: String
      label: "Name"
      max: 40
    moduleId:
      type: String
      label: "Module ID"
    creatorId:
      type: String
      label: "Creator ID"
      optional: true
  )
)