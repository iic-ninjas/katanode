Bookshelf = requireApp('lib/bookshelf')

module.exports = class Project extends Bookshelf.Model
  tableName: 'projects'
  hasTimestamps: ['created_at', 'updated_at']

  creator: ->
    User = require('./user') # to prevent circular dependency
    @belongsTo(User, 'creator_id')
