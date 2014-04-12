@AceEditor = class AceEditor
  
  constructor: (type) ->
    @editor = ace.edit("ace-editor-" + type)
    @editor.setTheme("ace/theme/twilight")
    @editor.getSession().setMode("ace/mode/xml")

  update: (contents) ->
    @editor.setValue(contents)
    @editor.getSelection().clearSelection()