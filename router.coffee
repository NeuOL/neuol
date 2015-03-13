express = require 'express'

router = express.Router()

# Router Handler
router.get '/', (req, res, next) ->
	res.render 'index',
		status: 'constructing',
		percentage: '0.8'




module.exports = router