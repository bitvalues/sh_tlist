defaultSettings = {
  shitheads = {},
}

function initializeSettings()
  -- do nothing for now
end

function addShithead(name, reason)
  name = name:lower()

  if arrayLength(settings.shitheads[name]) == 0 then
    settings.shitheads[name] = {}
  end

  settings.shitheads[name][os.time() .. ''] = reason
  config.save(settings)
end

function removeShithead(name)
  local shitheads = {}
  name = name:lower()

  for k, v in pairs(settings.shitheads) do
    if k:lower() ~= name then
      shitheads[k] = v
    end
  end

  settings.shitheads = shitheads
  config.save(settings)
end

function isShithead(name)
  name = name:lower()

  if settings.shitheads[name] ~= nil then
    return true
  end

  return false
end

function getShitheadReasons(name)
  name = name:lower()
  local reasons = settings.shitheads[name]

  if reasons == nil then
    return {}
  end

  return reasons
end
