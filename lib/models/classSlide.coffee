@ClassSlide = new Meteor.Collection("ClassSlide",
  schema: new SimpleSchema(
    classId:
      type: String
      label: "Class Id"
    slideId:
      type: String
      label: "Slide Id"
  )
)

@ClassSlide.slidesForClass = (id) ->
  ClassSlide.find({class_id: id}).fetch()