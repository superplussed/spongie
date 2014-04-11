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
    number:
      type: Number
      label: "Number"
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

@Slide.next = (id) ->
  slide = Slide.findOne(id)
  Slide.findOne({number: slide.number + 1, moduleId: slide.moduleId})
  
@Slide.prev = (id) ->  
  slide = Slide.findOne(id)
  if slide.number > 1
    Slide.findOne({number: slide.number - 1, moduleId: slide.moduleId})