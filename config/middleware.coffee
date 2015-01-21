path = require('path')
favicon = require('serve-favicon')
logger = require('morgan')
cookieParser = require('cookie-parser')
bodyParser = require('body-parser')
routes = require('../app/routes/index.coffee')
mincer = require('./mincer')
passport = require('passport')
githubStrategy = require('./github_strategy')
express = require('express')
session = require('./session')

module.exports = (app) ->
  # app.use(favicon(__dirname + '/public/favicon.ico')) uncomment after placing your favicon in ./public
  app.use(logger('dev'))
  app.use(bodyParser.json())
  app.use(bodyParser.urlencoded({ extended: false }))
  app.use(cookieParser())
  app.use(session())
  app.use(express.static(path.join(__dirname, 'public')))
  app.use('/assets', mincer)
  app.use(passport.initialize())
  app.use(passport.session())
  app.use('/', routes)


