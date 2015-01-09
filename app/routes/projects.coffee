ProjectsController = requireApp('app/controllers/projects_controller')

module.exports = (router) ->
  router.route('/projects')
    .get(ProjectsController.index)
    .post(ProjectsController.create)
