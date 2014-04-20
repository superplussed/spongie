Template.codeEditor.rendered = ->
  window.htmlEditor = new Editor "html"
  window.htmlEditor.update(Session.get('html'))
  window.htmlEditor.ace.on("change", ->
    Session.set('html', window.htmlEditor.value())
  )
  window.cssEditor = new Editor "css"
  window.cssEditor.update(Session.get('css'))
  window.cssEditor.ace.on("change", ->
    Session.set('css', window.cssEditor.value())
  )
  Template.codeEditor.addCodeToEditor()

Template.codeEditor.events = 
  'click .tab.css': ->
    $(".tab.css").addClass("active")
    $(".tab.html").removeClass("active")
    $("#ace-editor-html").css("visibility", "hidden")
    $("#ace-editor-css").css("visibility", "auto")
  'click .tab.html': ->
    $(".tab.css").removeClass("active")
    $(".tab.html").addClass("active")
    $("#ace-editor-css").css("visibility", "hidden")
    $("#ace-editor-html").css("visibility", "auto")

Template.codeEditor.addCodeToEditor = ->
  if Session.get("currentSlideId")
    slide = Slide.findOne(Session.get("currentSlideId"))
    Session.set('html', slide.html)
    window.htmlEditor.update(slide.html) if window.htmlEditor
    Session.set('css', slide.css)
    window.cssEditor.update(slide.css) if window.cssEditor