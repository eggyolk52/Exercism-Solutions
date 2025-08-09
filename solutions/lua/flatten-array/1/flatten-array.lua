local function flatten(input)
  local result = {}

  local function inner(input)
    if type(input) == "table" then
      for _, v in ipairs(input) do
        inner(v)
      end
    else
      table.insert(result, input)
    end
  end

  inner(input)

  return result
end

return flatten
