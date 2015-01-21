Bookshelf = requireApp('lib/bookshelf')

module.exports = class Session extends Bookshelf.Model
  tableName: 'sessions'