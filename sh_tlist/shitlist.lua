-- external dependencies
config = require('config')

-- internal dependencies
require('utilities')
require('settings')
require('commands')

-- addon setup
_addon.name = 'shitlist'
_addon.author = 'Bitvalues'
_addon.version = 1.0
_addon.command = 'shitlist'

-- load the settings
settings = config.load('data\\settings.xml', defaultSettings)
config.register(settings, initializeSettings)

-- setup things now
setupCommands()

-- quick reporting on number of shitheads remembered at load
local shitheadCount = arrayLength(settings.shitheads)

if shitheadCount > 1 then
  addonPrint(green(shitheadCount) .. yellow(' shitheads remembered!') .. darkRed(''))
else
  addonPrint(green(shitheadCount) .. yellow(' shithead remembered!') .. darkRed(''))
end
