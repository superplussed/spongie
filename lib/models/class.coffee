Books = new Meteor.Collection("classes",
  schema: new SimpleSchema(
    name:
      type: String
      label: "Name"
      max: 40
    location: 
      type: String
      label: "Location"
      max: 100
  )
)