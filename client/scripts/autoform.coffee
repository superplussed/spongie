# AutoForm.hooks
#   classCreateForm:
#     after:
#       insert: (error, result, template) ->
#         Class.update(result.id, {$set: {teacher_id: Meteor.userId()}})