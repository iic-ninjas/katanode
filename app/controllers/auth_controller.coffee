User = requireApp('app/models/user')

module.exports = class AuthController

  @callback: (req, res) ->
    User.where(uid: req.user.uid).fetch().then((user) ->
      promise = if user
        user.save(req.user, {patch: true})
      else
        new User(req.user).save()

      promise.then((savedUser) ->
        req.session.signedInUserId = savedUser.get('id')
        req.session.save((err) ->
          res.redirect('/')
        )
      )
    )