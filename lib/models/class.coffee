@Class = new Meteor.Collection("Class",
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
    creator_id: 
      type: String
      label: "Creator"
      optional: true
  )
)

