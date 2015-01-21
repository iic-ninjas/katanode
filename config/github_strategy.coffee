GithubStrategy = require('passport-github').Strategy
nconf = require('nconf')

strategy = new GithubStrategy(
  {
    clientID: nconf.get('github:clientID')
    clientSecret: nconf.get('github:clientSecret')
  },
  (accessToken, refreshToken, profile, done) ->
    done(null, profile)

)

module.exports = strategy