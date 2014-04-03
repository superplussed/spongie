Meteor.startup ->
  AccountsEntry.config
    privacyUrl: '/privacy'
    termsUrl: '/terms'
    homeRoute: '/'
    dashboardRoute: '/'
    profileRoute: 'profile'
    passwordSignupFields: 'USERNAME_AND_EMAIL'