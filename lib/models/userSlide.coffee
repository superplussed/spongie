@Slide = new Meteor.Collection("Slide",
  schema: new SimpleSchema(
    name:
      type: String
      label: "Name"
      max: 40
    html: 
      type: String
      label: "HTML"
      optional: true
    css: 
      type: String
      label: "CSS"
      optional: true
    slideId: 
      type: String
      label: "Slide ID"
    userId: 
      type: String
      label: "User ID"
  )
)