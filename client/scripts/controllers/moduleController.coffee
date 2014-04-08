Router.map ->
  @route "moduleNew",
    path: "/module/new"

  @route "moduleShow",
    path: "/module/:id",
    data: ->
      module:
        Module.findOne(this.params.id)

  @route "moduleUpdate",
    path: "/module/update/:id",
    data: ->
      editingDoc:
        Module.findOne(this.params.id)


Template.moduleIndex.availableModules = ->
  Module.find().fetch()