#= require frameworks
#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views

window.Katanode = new Backbone.Marionette.Application(regions: {mainRegion: '.page-content'})

Backbone.Marionette.TemplateCache.prototype.load = ->
  JST[@templateId]

Backbone.Marionette.Renderer.render = (templateName, data) ->
  template = Backbone.Marionette.TemplateCache.get("templates/#{templateName}")
  template(data)


Katanode.addInitializer((options) ->
  projects = new Katanode.Projects(options.projects)
  Katanode.mainRegion.show(new Katanode.PageLayout(projects: projects))
)


