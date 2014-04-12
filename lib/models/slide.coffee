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
      optional: true
    html: 
      type: String
      label: "HTML"
      optional: true
    css: 
      type: String
      label: "CSS"
      optional: true
    instruction: 
      type: String
      label: "Instruction"
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

@Slide.lastForModule = (moduleId) ->
  Slide.findOne({moduleId: moduleId}, {sort: {number: -1}})

@Slide.firstForModule = (moduleId) ->
  Slide.findOne({moduleId: moduleId, number: 1})

@Slide.next = (id) ->
  slide = Slide.findOne(id)
  Slide.findOne({number: slide.number + 1, moduleId: slide.moduleId})
  
@Slide.prev = (id) ->  
  slide = Slide.findOne(id)
  if slide.number > 1
    Slide.findOne({number: slide.number - 1, moduleId: slide.moduleId})