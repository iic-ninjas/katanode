ProjectsController = requireApp('app/controllers/projects_controller')

module.exports = (router) ->
  router.get('/projects', ProjectsController.index)