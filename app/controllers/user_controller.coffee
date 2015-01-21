User = requireApp('app/models/user')

module.exports = class UserController

  @load: (req, res, next) ->
    if req.session.signedInUserId
      User.where(id: req.session.signedInUserId).fetch().then((user) ->
        req.currentUser = user
        res.locals.currentUser = user
        next()
      )
    else
      next()