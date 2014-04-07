@Classes = new Meteor.Collection("Classes",
  schema: new SimpleSchema(
    name:
      type: String
      label: "Name"
      max: 40
    location: 
      type: String
      label: "Location"
      max: 100
      optional: true
    description:
      type: String
      label: "Description"
      optional: true
  )
)