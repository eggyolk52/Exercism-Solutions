return {
  encode = function(s)
    local chars = {}
    local result = {}
    local i = 1

    for char in s:gmatch(".") do
      table.insert(chars, char)
    end

    while i < #chars + 1 do
      local char = chars[i]
      local peek = chars[i + 1]
      local count = 1

      while char == peek do
        count = count + 1
        i = i + 1
        peek = chars[i + 1]
      end

      if count > 1 then
        table.insert(result, count)
      end
      table.insert(result, char)

      i = i + 1
    end

    return table.concat(result)
  end,

  decode = function(s)
    local chars = {}
    local result = {}
    local i = 1

    for char in s:gmatch(".") do
      table.insert(chars, char)
    end

    while i <= #chars do
      local num = ""

      while tonumber(chars[i]) do
        num = num .. chars[i]
        i = i + 1
      end

      table.insert(result, string.rep(chars[i], tonumber(num) or 1))
      i = i + 1
    end
    
    return table.concat(result)
  end
}
