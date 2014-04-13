Template.aceEditor.rendered = ->
  if Session.get('html')
    window.htmlEditor = new Editor "html"
    window.htmlEditor.update(Session.get('html'))
    window.htmlEditor.ace.on("change", ->
      Session.set('html', window.htmlEditor.value())
    )
    
  if Session.get('css')
    window.cssEditor = new Editor "css"
    window.cssEditor.update(Session.get('css'))
    window.cssEditor.ace.on("change", ->
      Session.set('css', window.cssEditor.value())
    )