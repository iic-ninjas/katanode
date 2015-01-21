passport = require('passport')
GithubStrategy = require('passport-github').Strategy
nconf = require('nconf')

passport.use(
  new GithubStrategy(
    {
      clientID: nconf.get('github:clientID')
      clientSecret: nconf.get('github:clientSecret')
    },
    (accessToken, refreshToken, profile, done) ->
      process.nextTick(->
        user = {uid:profile.id, username: profile.username, name: profile._json.name, avatar_url: profile._json.avatar_url, email: profile._json.email}
        done(null, user)
      )
  )
)

passport.serializeUser((user, done) -> done(null, user))
passport.deserializeUser((user, done) -> done(null, user))