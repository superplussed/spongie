Template.confirmModal.events = 
  "click #confirm-modal-background, click .confirm, click .cancel": ->
    Session.set("confirmModal", null)