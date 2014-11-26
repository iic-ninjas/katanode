bookshelf = requireApp('lib/bookshelf')

module.exports = class Project extends bookshelf.Model
  tableName: 'projects'
