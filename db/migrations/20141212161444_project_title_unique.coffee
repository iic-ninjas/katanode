
exports.up = (knex, Promise) ->
  SQL = """
    ALTER TABLE projects
      ALTER COLUMN title SET NOT NULL,
      ADD CONSTRAINT projects_title_unique UNIQUE (title)
  """
  knex.schema.raw(SQL)


exports.down = (knex, Promise) ->
  SQL = """
    ALTER TABLE projects
      ALTER COLUMN title DROP NOT NULL,
      DROP CONSTRAINT projects_title_unique
  """
  knex.schema.raw(SQL)
