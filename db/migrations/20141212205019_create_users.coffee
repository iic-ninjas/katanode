
exports.up = (knex, Promise) ->
  knex.schema.createTable('users', (t) ->
    t.increments()
    t.string('first_name')
    t.string('last_name')
    t.string('email').notNullable().unique()
    t.string('avatar_url')
    t.timestamps()
  )


exports.down = (knex, Promise) ->
  knex.schema.dropTable('users')
  