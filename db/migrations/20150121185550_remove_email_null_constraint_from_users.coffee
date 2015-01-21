
exports.up = (knex, Promise) ->
  SQL = """
    ALTER TABLE users
      ALTER COLUMN email DROP NOT NULL
  """
  knex.schema.raw(SQL)


exports.down = (knex, Promise) ->
  SQL = """
    ALTER TABLE users
      ALTER COLUMN email SET NOT NULL
  """
  knex.schema.raw(SQL)
  