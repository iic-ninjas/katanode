GithubStrategy = require('passport-github').Strategy
strategy = new GithubStrategy(
  {
    clientID: process.env.GITHUB_CLIENT_ID
    clientSecret: process.env.GITHUB_CLIENT_SECRET
  },
  (accessToken, refreshToken, profile, done) ->
    done(null, profile)

)

module.exports = strategy