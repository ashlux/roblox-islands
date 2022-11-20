Players = game.Players

local ID = Players:getUserIdFromNameAsync("prnainain")

print(ID)

setclipboard(ID)