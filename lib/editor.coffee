@Editor = class Editor
  
  constructor: (type) ->
    @ace = ace.edit("ace-editor-" + type)
    @ace.setTheme("ace/theme/twilight")
    if type == "html"
      @ace.getSession().setMode("ace/mode/xml")
    else
      @ace.getSession().setMode("ace/mode/" + type)

  update: (contents) ->
    @ace.setValue(contents)
    @ace.getSelection().clearSelection()

  value: ->
    @ace.getValue()