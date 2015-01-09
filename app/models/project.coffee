Bookshelf = requireApp('lib/bookshelf')

module.exports = class Project extends Bookshelf.Model
  tableName: 'projects'

  creator: ->
    User = require('./user') # to prevent circular dependency
    @belongsTo(User, 'creator_id')
