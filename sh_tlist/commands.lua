function setupCommands()
  windower.register_event('addon command', processCommands)
end

function processCommands(...)
  local commands = {...}
  local firstCommand = commands[1]

  if firstCommand ~= nil then
    firstCommand = firstCommand:lower()
  end

  if firstCommand == 'add' then
    local player = commands[2]
    local reason = concatArrayFromIndex(commands, 3)

    addShithead(player, reason)
    addonPrint(red(player) .. yellow(' added to shitlist!') .. darkRed(''))
  elseif firstCommand == 'remove' then
    local player = commands[2]

    removeShithead(player)
    addonPrint(red(player) .. yellow(' removed from shitlist!') .. darkRed(''))
  elseif firstCommand == 'check' then
    local player = commands[2]

    handleCheckIfPlayerShithead(player)
  else
    handleHelpCommand()
  end
end

function handleHelpCommand()
  addonPrint('Commands:')
  addonPrint(red('    shitlist ') .. yellow('add ') .. white('- adds a shithead to the shitlist') .. darkRed(''))
  addonPrint(red('    shitlist ') .. yellow('remove ') .. white('- removes a once-shithead from the shitlist') .. darkRed(''))
  addonPrint(red('    shitlist ') .. yellow('check ') .. white('- checks to see if someone is a shithead') .. darkRed(''))
end

function handleCheckIfPlayerShithead(name)
  if isShithead(name) then
    local reasons = getShitheadReasons(name)
    local totalReasons = arrayLength(reasons)

    if reasons == nil then
      addonPrint(green(name) .. white(' is thankfully... not a shithead!') .. darkRed(''))
      return
    end

    local output = red(name) .. yellow(' is a complete shithead for ') .. red(totalReasons) .. yellow(' reason(s):')
    for k, v in pairs(reasons) do
      output = output .. red('\n    - ') .. ice('[' .. os.date('%Y-%m-%d %H:%M:%S', tonumber(k)) .. '] ') .. yellow(v)
    end

    addonPrint(output .. darkRed(''))
  else
    addonPrint(green(name) .. white(' is thankfully... not a shithead!') .. darkRed(''))
  end
end
