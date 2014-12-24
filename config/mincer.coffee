Mincer = require('mincer')

environment = new Mincer.Environment()
environment.appendPath('app/assets/images')
environment.appendPath('app/assets/javascripts')
environment.appendPath('app/assets/stylesheets')
environment.appendPath('app/assets/templates')
environment.appendPath('vendor/assets/javascripts')

module.exports = Mincer.createServer(environment)