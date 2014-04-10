@Exercise = new Meteor.Collection("Exercise",
  schema: new SimpleSchema(
    name:
      type: String
      label: "Name"
      max: 40
    slide:
      type: String
      label: "Slide"
    code: 
      type: String
      label: "Code"
    sectionId: 
      type: String
      label: "Section ID"
    creatorId:
      type: String
      label: "Creator ID"
      optional: true
  )
)