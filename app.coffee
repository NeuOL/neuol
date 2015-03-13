bodyParser  = require 'body-parser'
cookieParser= require 'cookie-parser'
express     = require 'express'
logger      = require 'morgan'
path        = require 'path'
session     = require 'express-session'
router      = require './router'

app         = express()

# set the port to listen
app.set 'port', process.env.PORT || 8080

# set the view directory and engine as 'jade'.
app.set 'views', path.join __dirname, '..', 'view', 'jade'
app.set 'view engine', 'jade'

# log the requests.
app.use logger 'combined'

# sesion handling
app.use session
  resave            : on
  saveUninitialized : on
  secret            : 'neuol'

# parse the request body.
app.use bodyParser.json()
app.use bodyParser.urlencoded extended: off
app.use cookieParser()

# Set router
app.use '/', router

# Mount CSS directory as '/style'.
app.use '/style', express.static path.join __dirname, '..', 'view', 'style'

# Mount client scripts referenced as '/script'.
app.use '/script', express.static path.join __dirname, '..', 'client'

app.listen app.get('port'), ->
  console.log "Server is running at #{app.get('port')}."

