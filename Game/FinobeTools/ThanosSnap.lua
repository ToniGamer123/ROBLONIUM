--THANOS SNAP
local temp = (game.Players.NumPlayers / 2)
stats = game.Players:GetChildren() for i = 1,#stats do
if i ~= temp then
stats[i]:Remove()
end
end