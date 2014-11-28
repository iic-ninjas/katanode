express = require('express')
router = express.Router()

# GET home page
router.get('/', (req, res) ->
  res.redirect('/projects')
)

require('./projects')(router)

module.exports = router
