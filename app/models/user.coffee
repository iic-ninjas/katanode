Bookshelf = requireApp('lib/bookshelf')

module.exports = class User extends Bookshelf.Model
  tableName: 'users'

  projects: ->
    Project = require('./project') # to prevent circular dependency
    @hasMany(Project, 'creator_id')