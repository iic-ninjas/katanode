knexConfig = requireApp('knexfile')
environment = process.env.NODE_ENV || 'development'
module.exports = require('knex')(knexConfig[environment])