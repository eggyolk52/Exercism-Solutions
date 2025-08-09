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
  tbl = {}
  setmetatable(tbl, self)
  self.__index = self

  self.name = name
  self.strength = ability(roll_dice())
  self.dexterity = ability(roll_dice())
  self.constitution = ability(roll_dice())
  self.intelligence = ability(roll_dice())
  self.wisdom = ability(roll_dice())
  self.charisma = ability(roll_dice())
  self.hitpoints = 10 + modifier(self.constitution)

  return tbl
end

return {
  Character = Character,
  ability = ability,
  roll_dice = roll_dice,
  modifier = modifier
}
