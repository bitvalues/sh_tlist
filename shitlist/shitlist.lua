-- external dependencies
config = require('config')

-- internal dependencies

-- addon setup
_addon.name = 'shitlist'
_addon.author = 'Bitvalues'
_addon.version = 1.0
_addon.command = 'shitlist'

-- load the settings
settings = config.load('data\\settings.xml', defaultSettings)
config.register(settings, initializeSettings)
