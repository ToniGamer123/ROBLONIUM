local A1 = game.Lighting

game:WaitForChild("Workspace") -- waits for entire game to load

while wait() do -- loops the script

A1:ClearAllChildren()-- clears the lighting

game.Workspace.Terrain:ClearAllChildren() -- clears terrain

for i,child in pairs(workspace:GetDescendants()) do -- clears the parts of added things
   if child:IsA("Part") then
       child.Color = Color3.new(99, 95, 98)
       child.BackSurface = "Smooth"
       child.BottomSurface = "Smooth"
       child.FrontSurface = "Smooth"
       child.LeftSurface = "Smooth"
       child.RightSurface = "Smooth"
       child.TopSurface = "Smooth"
       child.Material = "Plastic"
   end
end -- ends the clearing and remodle

A1.Ambient = Color3.new(0, 0, 0)
A1.Brightness = 1
A1.ColorShift_Bottom = Color3.new(0, 0, 0)
A1.ColorShift_Top = Color3.new(0, 0, 0)
A1.GlobalShadows = true
A1.OutdoorAmbient = Color3.new(127, 127, 127)
A1.Outlines = false
A1.ClockTime = 14
A1.GeographicLatitude = 41.733
A1.TimeOfDay = ("14:00:00")
A1.FogColor = Color3.new(191, 191, 191)
A1.FogEnd = 100000000
A1.FogStart = 0

for _,v in pairs(workspace:GetDescendants()) do
   if v.ClassName == "Fire" then
       v:Destroy()
   end
end

for _,v in pairs(workspace:GetDescendants()) do
   if v.ClassName == "PointLight" then
       v:Destroy()
   end
end

for i,v in next,workspace:children''do
if(v:IsA'BasePart')then
if v:FindFirstChildOfClass("BillboardGui") then
v:FindFirstChildOfClass("BillboardGui"):Destroy()
end
end
end
end
