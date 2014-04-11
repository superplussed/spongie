@Meeting = new Meteor.Collection("Meeting",
  schema: new SimpleSchema(
    startAt:
      type: Date
      label: "Start At"
    endAt:
      type: Date
      label: "End At"
    classId:
      type: String
      label: "Class Id"
    location:
      type: String
      label: "Location"
      optional: true
  )
)