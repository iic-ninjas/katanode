class Katanode.AddProjectView extends Backbone.Marionette.ItemView
  template: 'add_project'

  ui:
    submitBtn: 'button'
    inputTitle: '.input-title'
    inputSubtitle: '.input-subtitle'

  events: ->
    'click @ui.submitBtn': '_onClick'

  _onClick: (event) ->
    event.preventDefault()
    title = @ui.inputTitle.val()
    subtitle = @ui.inputSubtitle.val()
    @options.projects.create({title: title, subtitle: subtitle},
      {
        wait: true
        success: =>
          @ui.inputTitle.val('')
          @ui.inputSubtitle.val('')
      }
    )

