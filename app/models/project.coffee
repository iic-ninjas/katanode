Bookshelf = requireApp('lib/bookshelf')
User = require('./user')

module.exports = class Project extends Bookshelf.Model
  tableName: 'projects'

  creator: ->
    @belongsTo(User, 'creator_id')
