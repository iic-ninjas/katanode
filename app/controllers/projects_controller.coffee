Project = requireApp('app/models/project')

module.exports = class ProjectsController

  @index: (req, res) ->
    Project.fetchAll().then((projects) ->
      res.render('projects/index', projects: projects)
    )