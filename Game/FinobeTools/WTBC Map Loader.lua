workspace.Lobby.CollisionOff.Floor.CanCollide = false
Stage = "Giant Turtle by ninjayeti"
if workspace:FindFirstChild("MAP") ~= nil then
workspace.MAP:Remove()
workspace.Ramps:Remove()
end
game.Players.LoaclPlayer.Backpack.GiantBall.CanShoot.Value        = true
game.Players.LocalPlayer.PlayerGui.PlayGui.Play.Position          = UDim2.new(0, 0, 0.15, 0)
game.Players.LocalPlayer.PlayerGui.PlayGui.Play.Visible           = true
game.Players.LocalPlayer.PlayerGui.PlayGui.Play.Function.Disabled = false
h                                                                 = game.Lighting.Maps:FindFirstChild(Stage)
i                                                                 = h:Clone()
i.Parent                                                          = workspace
i.Name                                                            = "MAP"
i:MakeJoints()
g                                                                  = game.Lighting.Rounds.Classic.Ramps:Clone()
g.Parent                                                           = workspace
g:MakeJoints()