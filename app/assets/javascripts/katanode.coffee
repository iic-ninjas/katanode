window.Katanode = new Backbone.Marionette.Application(regions: {mainRegion: '.page-content'})

Backbone.Marionette.TemplateCache.prototype.load = ->
  JST[@templateId]

Backbone.Marionette.Renderer.render = (templateName, data) ->
  template = Backbone.Marionette.TemplateCache.get(templateName)
  template(data)


Katanode.addInitializer((options) ->
  projects = new Katanode.Projects(options.projects)
  Katanode.mainRegion.show(new Katanode.PageLayout(projects: projects))
)


