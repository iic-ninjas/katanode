class Katanode.SidebarView extends Backbone.Marionette.LayoutView
  template: 'sidebar'
  className: 'panel panel-default sidebar'

  regions:
    addProject: '.add-project'

  onShow: ->
    @getRegion('addProject').show(new Katanode.AddProjectView(projects: @options.projects))