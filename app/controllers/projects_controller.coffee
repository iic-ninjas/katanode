Project = requireApp('app/models/project')
User = requireApp('app/models/user')

module.exports = class ProjectsController

  @index: (req, res) ->
    Project.fetchAll(withRelated: ['creator']).then((projects) ->
      res.render('projects/index', projects: projects.toJSON())
    )

  @create: (req, res) ->
    new User(id: 1).projects().fetch().then((projects) ->
      projects.create(title: req.body.title, subtitle: req.body.subtitle).then((project) ->
        res.json(project.toJSON())
      ).catch((error) ->
        console.log error
      )
    )
