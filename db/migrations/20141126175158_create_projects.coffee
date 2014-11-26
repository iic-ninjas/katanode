#t.string   "title"
#t.string   "subtitle"
#t.string   "repo_url"
#t.string   "demo_url"
#t.string   "status",          default: "idea"
#t.datetime "created_at"
#t.datetime "updated_at"
#t.integer  "ideator_id"
#t.integer  "organization_id"
#t.datetime "lifted_at"
#t.string   "image_url"


exports.up = (knex, Promise) ->
  knex.schema.createTable('projects', (t) ->
    t.increments('id')
    t.string('title').unique()
    t.string('subtitle')
    t.string('demo_url')
    t.string('status')
    t.timestamps()
  )

exports.down = (knex, Promise) ->
  knex.schema.dropTable('projects')
  