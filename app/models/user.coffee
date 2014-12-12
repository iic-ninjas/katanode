Bookshelf = requireApp('lib/bookshelf')

module.exports = class User extends Bookshelf.Model
  tableName: 'users'