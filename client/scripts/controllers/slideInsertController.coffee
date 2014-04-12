class @SlideInsertController extends RouteController
  data: ->
    slide:
      Module.findOne(@params.id)

AutoForm.hooks
  slideForm:
    before:
      insert: (slide) ->
        maxSlide = Slide.lastForModule(slide.moduleId)
        slide.number = if maxSlide then maxSlide.number + 1 else 1
        slide
    after:
      insert: (error, result, template) ->
        if error
          Alerts.add(error.message , 'info')
        else
          slide = Slide.findOne(result)
          Alerts.add("Slide '" + slide.name + "' has been created.", 'info')
