function setupCommands()
  windower.register_event('addon command', processCommands)
end

function processCommands(...)
  local commands = {...}
  local firstCommand = commands[1]

  if firstCommand == 'add' then
    --
  elseif firstCommand == 'remove' then
    --
  else
    handleHelpCommand()
  end
end

function handleHelpCommand()
  addonPrint('Commands:')
  addonPrint(red('shitlist ') .. yellow('add ') .. darkRed(''))
  addonPrint(red('shitlist ') .. yellow('remove ') .. darkRed(''))
end
