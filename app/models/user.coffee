Bookshelf = requireApp('lib/bookshelf')

module.exports = class User extends Bookshelf.Model
  tableName: 'users'
  hasTimestamps: ['created_at', 'updated_at']

  projects: ->
    Project = require('./project') # to prevent circular dependency
    @hasMany(Project, 'creator_id')