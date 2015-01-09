debug = require('debug')('katanode')
Project = requireApp('app/models/project')
User = requireApp('app/models/user')

module.exports = class ProjectsController

  @index: (req, res) ->
    Project.fetchAll(withRelated: ['creator']).then((projects) ->
      res.render('projects/index', projects: projects.toJSON())
    )

  @create: (req, res) ->
    debug('Creating project with the following attributes: %s', req.body)
    new User(id: 1).projects().fetch().then((projects) ->
      projects.create(title: req.body.title, subtitle: req.body.subtitle).then((project) ->
        debug('Created project with id %d successfully', project.get('id'))
        res.json(project.toJSON())
      ).catch((error) ->
        console.error(error)
        res.status(500).json(error: error)
      )
    )
