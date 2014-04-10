@Exercise = new Meteor.Collection("Exercise",
  schema: new SimpleSchema(
    name:
      type: String
      label: "Name"
      max: 40
    slide:
      type: String
      label: "Slide"
      optional: true
    code: 
      type: String
      label: "Code"
      optional: true
    sectionId: 
      type: String
      label: "Section ID"
    creatorId:
      type: String
      label: "Creator ID"
      optional: true
  )
)