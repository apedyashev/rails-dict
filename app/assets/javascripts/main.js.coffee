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

  isExpanded: false

  expand: ->
    @set('isExpanded', true)

  contract: ->
    @set('isExpanded', false)


DictApp.Router = Ember.Router.extend
    enableLogging: true,
    location: 'hash'

DictApp.Router.map ->
  # put your routes here
  @route 'home'
  @route 'about'
  @route 'sidebar'
#  @resource "photos", ->
#    @route "edit", { path: "/:photo_id" }

#DictApp.Router.reopen
#  location: 'history'


DictApp.IndexRoute = Ember.Route.extend
  model: ->
    return ['red', 'yellow', 'blue'];

#HOME
DictApp.HomeRoute = Ember.Route.extend
  #If you don't explicitly define an App.IndexController, Ember.js will automatically generate one for you.
  setupController: (controller)->
    controller.set 'title', 'Home'

  renderTemplate: ->
    @render
      outlet: 'content'

DictApp.HomeView = Ember.View.extend
   templateName: 'home'


#ABOUT
DictApp.AboutRoute = Ember.Route.extend
  #If you don't explicitly define an App.IndexController, Ember.js will automatically generate one for you.
  setupController: (controller)->
    controller.set 'title', 'About'

  renderTemplate: ->
    @render
      outlet: 'content'

DictApp.AboutView = Ember.View.extend
   templateName: 'about'


#SIDEBAR
DictApp.SidebarRoute = Ember.Route.extend
  #If you don't explicitly define an App.IndexController, Ember.js will automatically generate one for you.
  setupController: (controller)->
    now = new Date
    controller.set 'items', [
      title: "item1#{now.getTime()}"
    ,
      title: "item2#{now.getTime()}"
    ,
      title: "item3#{now.getTime()}"
    ]

  renderTemplate: ->
    @render
      outlet: 'sidebar'

DictApp.SidebarView = Ember.View.extend
   templateName: 'sidebar'


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