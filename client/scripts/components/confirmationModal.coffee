Template.confirmationModal.events = 
  "click #confirm-modal-background": ->
    Session.set("confirm", null)

  "click .confirm": ->
    Session.set("confirm", null)