Meteor.startup ->
  AccountsEntry.config
    privacyUrl: '/privacy'
    termsUrl: '/terms'
    homeRoute: '/'
    dashboardRoute: '/dashboard'
    profileRoute: 'profile'
    passwordSignupFields: 'USERNAME_AND_EMAIL'