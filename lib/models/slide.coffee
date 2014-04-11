@Slide = new Meteor.Collection("Slide",
  schema: new SimpleSchema(
    name:
      type: String
      label: "Name"
      max: 40
    content:
      type: String
      label: "Content"
      optional: true
    code: 
      type: String
      label: "Code"
      optional: true
    moduleId: 
      type: String
      label: "Module ID"
    creatorId:
      type: String
      label: "Creator ID"
      optional: true
  )
)