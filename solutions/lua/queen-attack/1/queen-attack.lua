return function(pos)
  assert(pos.row >= 0 and pos.row <= 7)
  assert(pos.column >= 0 and pos.column <= 7)

  pos.can_attack = function(queen)
    return pos.row == queen.row
        or pos.column == queen.column
        or pos.row - pos.column == queen.row - queen.column
        or pos.row + pos.column == queen.row + queen.column
  end

  return pos
end
