Template.aceEditor.rendered = ->
  if Session.get('html')
    window.htmlEditor = new AceEditor "html"
    window.htmlEditor.update(Session.get('html'))