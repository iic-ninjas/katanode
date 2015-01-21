
exports.up = (knex, Promise) ->
  knex.schema.createTable('sessions', (table) ->
    table.increments('id')
    table.string('sid').unique()
    table.string('data')
  )

exports.down = (knex, Promise) ->
  knex.schema.dropTable('sessions')
  