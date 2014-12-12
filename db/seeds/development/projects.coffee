insertProject = (knex, title, subtitle) ->
  knex('projects').where(title: title).then((rows) ->
    knex('projects').insert(title: title, subtitle: subtitle) if rows.length == 0
  )

exports.seed = (knex, Promise) ->
  Promise.all([
    insertProject(knex, 'Lunchtime', 'An application for organizing group lunches'),
    insertProject(knex, 'Katanode', 'Katalog implemented in NodeJS'),
    insertProject(knex, 'Hodor My IP', 'Hodor reads your IP digit by digit'),
    insertProject(knex, 'Tiuli print', 'More efficient way to print tracks from Tiuli')
    insertProject(knex, 'Mitnadvim.net', 'Application that helps schools find volunteers for all sort of activities')
  ])

