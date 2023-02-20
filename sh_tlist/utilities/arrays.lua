function arrayLength(arr)
  local count = 0

  if arr == nil then
    return count
  end

  for k, v in pairs(arr) do
    count = count + 1
  end

  return count
end
