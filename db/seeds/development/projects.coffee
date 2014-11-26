
exports.seed = (knex, Promise) ->
  knex('projects').insert(title: 'Lunchtime', subtitle: 'An application for organizing group lunches').then(->
    Promise.resolve()
  )