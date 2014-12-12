insertProject = (knex, title, subtitle) ->
  knex('projects').whereNotExists(knex.select('id').from('projects').where(title: title)).first().then((row) ->
    knex('projects').insert(title: title, subtitle: subtitle) if row?
  )

exports.seed = (knex, Promise) ->
  Promise.all([
    insertProject(knex, 'Lunchtime', 'An application for organizing group lunches'),
    insertProject(knex, 'Katanode', 'Katalog implemented in NodeJS')
  ])

