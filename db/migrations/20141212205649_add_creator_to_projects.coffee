
exports.up = (knex, Promise) ->
  knex.schema.table('projects', (t) ->
    t.integer('creator_id').unsigned().references('id').inTable('users')
  )


exports.down = (knex, Promise) ->
  knex.schema.table('projects', (t) ->
    t.dropColumn('creator_id')
  )
  