@Editor = class Editor
  
  constructor: (type) ->
    @ace = ace.edit("ace-editor-" + type)
    @ace.setTheme("ace/theme/twilight")
    @ace.getSession().setMode("ace/mode/xml")

  update: (contents) ->
    @ace.setValue(contents)
    @ace.getSelection().clearSelection()

  value: ->
    @ace.getValue()