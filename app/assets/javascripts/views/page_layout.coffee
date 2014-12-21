class Katanode.PageLayout extends Backbone.Marionette.LayoutView
  template: 'page_layout'

  regions:
    main: '.main'
    sidebar: '.sidebar'

  onShow: ->
    @getRegion('main').show(new Katanode.ProjectsView(collection: @options.projects))
    @getRegion('sidebar').show(new Katanode.SidebarView())