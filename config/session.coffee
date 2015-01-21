session = require('session')
Session = requireApp('app/models/session')
BookshelfStore = require('connect-bookshelf')(session)

module.exports = ->
  session(
    store: new BookshelfStore(model: Session)
    secret: 'uuid is so lame, i do not want to generate a secret'
    resave: false
    saveUninitialized: false
  )