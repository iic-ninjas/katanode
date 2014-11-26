# Update with your config settings.

module.exports =
  development:
    client: 'postgresql'
    connection:
      database: 'katanode'
    pool:
      min: 2
      max: 10
    migrations:
      directory: './db/migrations'
      tableName: 'migrations'
    seeds:
      directory: './db/seeds/development'
    debug: true