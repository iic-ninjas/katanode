
exports.up = (knex, Promise) ->
  SQL = """
    ALTER TABLE sessions
      ALTER COLUMN data TYPE text
  """
  knex.schema.raw(SQL)


exports.down = (knex, Promise) ->
  SQL = """
    ALTER TABLE sessions
      ALTER COLUMN data TYPE varchar
  """
  knex.schema.raw(SQL)
  