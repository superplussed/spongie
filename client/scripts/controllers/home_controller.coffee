class @HomeController extends RouteController
  onAfterAction: ->
    Session.set("currentClassid", null)
    Template.home.helpers
      availableClasses: ->
        Class.find().fetch()
      alreadyJoined: ->
        UserClass.findOne({class_id: this._id, user_id: Meteor.userId()})
      
    Template.home.events =
      'click .join': ->
        unless UserClass.userHasJoined(Meteor.userId(), this._id)
          Alerts.add('You have joined a class!', 'info')
          UserClass.insert({class_id: this._id, user_id: Meteor.userId()})


