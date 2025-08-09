local Character = {}

local function ability(scores)
  table.sort(scores)

  return scores[2] + scores[3] + scores[4]
end

local function roll_dice()
  return {
    math.random(6),
    math.random(6),
    math.random(6),
    math.random(6),
  }
end

local function modifier(input)
  return math.floor((input - 10) / 2)
end

function Character:new(name)
  return {
    name = name,
    strength = ability(roll_dice),
    dexterity = ability(roll_dice),
    constitution = ability(roll_dice),
    intelligence = ability(roll_dice),
    wisdom = ability(roll_dice),
    charisma = ability(roll_dice),
    hitpoints = 10 + modifier(self.constitution),
  }
end

return {
  Character = Character,
  ability = ability,
  roll_dice = roll_dice,
  modifier = modifier
}
