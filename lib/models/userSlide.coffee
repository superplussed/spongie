@UserSlide = new Meteor.Collection("UserSlide",
  schema: new SimpleSchema(
    name:
      type: String
      label: "Name"
    html: 
      max: 40
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