
exports.up = (knex, Promise) ->
  knex.schema.table('users', (table) ->
    table.dropColumn('last_name')
    table.renameColumn('first_name', 'name')
    table.string('username')
    table.bigInteger('uid').unique()
  )

exports.down = (knex, Promise) ->
  knex.schema.table('users', (table) ->
    table.renameColumn('name', 'first_name')
    table.string('last_name')
    table.dropColumn('username')
    table.dropColumn('uid')
  )
  