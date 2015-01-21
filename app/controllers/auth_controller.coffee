User = requireApp('app/models/user')
session = require('express-session')

module.exports = class AuthController

  @callback: (req, res) ->
    User.where(uid: req.user.uid).fetch().then((user) ->
      promise = if user
        user.save(req.user, {patch: true})
      else
        new User(req.user).save()

      promise.then((savedUser) ->
        session.signedInUserId = savedUser.get('id')
        res.redirect('/')
      )
    )