express			= require 'express'

router = express.Router()

router.get '/', (req, res, next) ->
	res.send 'test'

####
moduele.exports = router