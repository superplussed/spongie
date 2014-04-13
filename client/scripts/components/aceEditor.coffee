Template.aceEditor.rendered = ->
  if Session.get('html')
    window.htmlEditor = new Editor "html"
    window.htmlEditor.update(Session.get('html'))
    window.htmlEditor.ace.on("change", ->
      Session.set('html', window.htmlEditor.value())
    )