DictApp = Ember.Application.create
  LOG_TRANSITIONS: true
  ready: ->
    #ready

# Each template has an associated controller: this is where the template finds the properties that it displays.
DictApp.ApplicationController = Ember.Controller.extend
  firstName: 'Alexey'
  lastName:  'Pedyashev'
  avatar:    'https://pp.vk.me/c417025/v417025761/4a66/CwUZXNw8YV4.jpg'
  someArray: [1, 'a', 5, 666]
  priorityCls: 'low'
  isCompleted: yes
  isEnabled: no
  watches: [ 
    brand: 'Tissot'
    model: 'T40.1.426.51'
   ,
    brand: 'Rolex'
    model: 'Sky-Dweller'
  ]

DictApp.Router.map ->
  # put your routes here
  @resource "photos", ->
    @resource "photo", { path: "/:photo_id" }, ->
      this.route "comments"
      this.route "comment", { path: "/comments/:comment_id" }

DictApp.IndexRoute = Ember.Route.extend
  model: ->
    return ['red', 'yellow', 'blue'];
    
    
1
###
$ ->
  window.App = Ember.Application.create
    LOG_TRANSITIONS: true
    ready: ->
      #ready

  App.ApplicationController = Ember.Controller.extend()

  App.ApplicationView = Ember.View.extend
   templateName: 'application'

  App.ApplicationRoute = Ember.Route.extend()
  
  
  
  

  # routers
  App.Router = Ember.Router.extend
    enableLogging: true,
    location: 'hash'

  App.Router.map ->
    this.route('index', { path: '/admin/panel' })
    this.route('users')
    this.route('topics')
    
  # define landing page by redirecting to it from index route
  App.IndexRoute = Ember.Route.extend
    redirect: ->
      this.transitionTo('users');


  #
  # Users
  #
  App.UserModel = Ember.Object.extend
    id: null
    firstName: null
    lastName: null
    
  App.UserStore = Ember.Object.extend
    read: (id)->
      {
      id: 1
      firstName: Alexey
      lastName: Pedyashev
      }
      
  App.UsersController = Ember.Controller.extend
    store: App.UserStore.create()
    
  App.UsersView = Ember.View.extend
   templateName: 'users'
###