path = require('path')
favicon = require('serve-favicon')
logger = require('morgan')
cookieParser = require('cookie-parser')
bodyParser = require('body-parser')
routes = require('../app/routes/index.coffee')
mincer = require('./mincer')
express = require('express')

module.exports = (app) ->
  # app.use(favicon(__dirname + '/public/favicon.ico')) uncomment after placing your favicon in ./public
  app.use(logger('dev'))
  app.use(bodyParser.json())
  app.use(bodyParser.urlencoded({ extended: false }))
  app.use(cookieParser())
  app.use('/', routes)
  app.use(express.static(path.join(__dirname, 'public')))
  app.use('/assets', mincer)
