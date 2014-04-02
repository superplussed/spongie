Router.map(function() {
  this.route('home', {path: '/'})
  this.route('admin', {path: '/admin'})
});

// Router.configure({
//     layoutTemplate: 'layout'
// });

// Router.map(function() {
//     this.route('home', {
//         path: '/',
//         template: 'home'
//     });

//     this.route('admin', {
//         path:'/admin',
//         template: 'accountsAdmin',
//         onBeforeAction: function() {
//             if(!Roles.userIsInRole(Meteor.user(), ['admin'])) {
//                 Log('Redirecting');
//                 this.redirect('/');
//             }
//         }
//     });
// });