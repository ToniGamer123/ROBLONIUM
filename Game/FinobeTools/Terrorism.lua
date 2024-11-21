--local array = {494966484, 1182511580, 169602388}

--for i,v in pairs(array)
M = Game:GetService("InsertService"):LoadAsset(169602388)
M.Parent = Game.Workspace 
M:MakeJoints()
M:MoveTo(Game.Players.LocalPlayer.Character.Torso.Position + Vector3.new(0, 0, 0))
--end
