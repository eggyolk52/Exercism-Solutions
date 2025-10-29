local all_your_base = {}

all_your_base.convert = function(from_digits, from_base)
  assert(from_base >= 2, 'invalid input base')

  local value = 0

  for _, digit in ipairs(from_digits) do
    assert(digit >= 0, 'negative digits are not allowed')
    assert(digit < from_base, 'digit out of range')

    value = value * from_base + digit
  end

  return {
    to = function(to_base)
      assert(to_base >= 2, 'invalid output base')

      local result = {}
      local n = value

      while n > 0 do
        table.insert(result, 1, n % to_base)
        n = math.floor(n / to_base)
      end

      if next(result) == nil then
        return { 0 }
      else
        return result
      end
    end
  }
end


return all_your_base
