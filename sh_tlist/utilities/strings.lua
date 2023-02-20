function concatArrayFromIndex(arr, index)
  local tmp = ""

  for k, v in pairs(arr) do
    if k >= index then
      if tmp == "" then
        tmp = v
      else
        tmp = tmp .. " " .. v
      end
    end
  end

  return tmp
end
