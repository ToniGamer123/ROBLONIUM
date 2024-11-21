while workspace:FindFirstChild("Message") ~= nil do
workspace.Message:Remove()
end
if workspace:FindFirstChild("RUN") ~= nil then
Workspace.RUN:Remove()
end
if workspace:FindFirstChild("WTBC") ~= nil then
Workspace.WTBC:Remove()
end
if workspace:FindFirstChild("Hungries") ~= nil then
Workspace.Hungries:Remove()
end
if game.Lighting:FindFirstChild("RUNMaps") ~= nil then
game.Lighting.RUNMaps:Remove()
end
if workspace:FindFirstChild("WTBC") ~= nil then
Workspace.WTBC:Remove()
end
if workspace:FindFirstChild("RUNMap") ~= nil then
Workspace.RUNMap:Remove()
end
if game.Lighting:FindFirstChild("RUNMaps") == nil then
variable = Instance.new("IntValue")
variable.Parent = game.Lighting
variable.Name = "RUNMaps"
variable.Value = 1
M = Game:GetService("InsertService"):LoadAsset(124001562) 
M.Parent = Game.Lighting.RUNMaps
M.Name = "Map For Lukekneenew by DSNinjaX"
M = Game:GetService("InsertService"):LoadAsset(124130051) 
M.Parent = Game.Lighting.RUNMaps
M.Name = "Lake Side by TangibleCraze11"
M = Game:GetService("InsertService"):LoadAsset(125719545) 
M.Parent = Game.Lighting.RUNMaps
M.Name = "Hill Shoot by IBallzz"
M = Game:GetService("InsertService"):LoadAsset(120015055) 
M.Parent = Game.Lighting.RUNMaps
M.Name = "Turtle by ninjayeti"
M = Game:GetService("InsertService"):LoadAsset(119585839) 
M.Parent = Game.Lighting.RUNMaps
M.Name = "Farm by ninjayeti"
M = Game:GetService("InsertService"):LoadAsset(119423934) 
M.Parent = Game.Lighting.RUNMaps
M.Name = "The Shady Shards by ninjayeti"
end
variable = Instance.new("IntValue")
variable.Parent = workspace
variable.Name = "RUN"
variable.Value = 1
Hint = Instance.new("Hint")
Hint.Text = "Loading RUN (Portable Edition)..."
Hint.Parent = workspace
wait(2)
Hint.Text = "\/Written by Brent Da Mage\/"
wait(5)

Badges = {[0] = 30058718, [100] = 29890585, [200] = 29918752, [400] = 30057939}
Playing = {}
Tutorial = {"http://www.roblox.com/asset/?id=30093873", "http://www.roblox.com/asset/?id=30093900", "http://www.roblox.com/asset/?id=30093954", "http://www.roblox.com/asset/?id=30094010", "http://www.roblox.com/asset/?id=30094028", "http://www.roblox.com/asset/?id=30094049"}
BallName = "bawlz"
Base = workspace.Base
CountDownTime = 20
Siz = 8
Size = Vector3.new(Siz, Siz, Siz)
Multiplier = 1
SuckSpeed = 1.5
SuckSoundId = "http://www.roblox.com/asset/?id=10722059"
TickSoundId = "rbxasset://sounds\\clickfast.wav"
PingSoundId = "http://www.roblox.com/asset/?id=13114759"
HorrorSoundId = "http://www.roblox.com/asset/?id=2767085"
LostSoundId = "http://www.roblox.com/asset/?id=13378571"
WonSoundId = "http://www.roblox.com/asset/?id=15632562"
EatTime = 2
BallMass = 15000
copyrate = 12
Powerups = {}
Lobby = workspace.Base
VipId = 37994942

WavePoints = 200
RawStages = game.Lighting.RUNMaps:GetChildren()
Stages = {}
for i, v in pairs(RawStages) do
if v:IsA("Model") then
local c = math.random(0, 1)
if c == 0 then
table.insert(Stages, 1, v)
else
table.insert(Stages, v)
end
end
end
Index = math.random(1, #Stages)
TickSound = Instance.new("Sound")
TickSound.Pitch = 2
TickSound.Volume = 0.3
TickSound.SoundId = TickSoundId
TickSound.Parent = workspace
PingSound = Instance.new("Sound")
PingSound.Pitch = 0.7
PingSound.Volume = 1
PingSound.SoundId = PingSoundId
PingSound.Parent = workspace
HorrorSound = Instance.new("Sound")
HorrorSound.Pitch = 1.5
HorrorSound.Volume = 0.3
HorrorSound.SoundId = HorrorSoundId
HorrorSound.Parent = workspace
LostSound = Instance.new("Sound")
LostSound.Pitch = 0.5
LostSound.Volume = 1
LostSound.SoundId = LostSoundId
LostSound.Parent = workspace
WonSound = Instance.new("Sound")
WonSound.Pitch = 1.2
WonSound.Volume = 1
WonSound.SoundId = WonSoundId
WonSound.Parent = workspace

function GetStage()
Talk("Choosing stage...", 2)
local index = Index
local frames = 15
for i = 1, frames do
index = index + 1
if index > #Stages then index = 1 end
TickSound:Play()
Talk("Stage: " .. Stages[index].Name, i/frames*0.5)
end
Index = Index + 1
if Index > #Stages then Index = 1 end
local Stage = Stages[Index]
Talk("Stage: " .. Stage.Name, 0.6)
PingSound:Play()
Talk(Stage.Name .. " is selected!", 5)
return Stage
end

function Talk(Text, Time)
Hint.Text = Text
--collectgarbage("collect")
wait(Time)
end
function StartWave()
WaveTime = 60
local pSurvivors = Game:GetService("Players"):GetChildren()
local nPlayers = 0
for Index, Survivor in pairs(pSurvivors) do
if Playing[Survivor] then
nPlayers = nPlayers + 1
end
end

Survivors = {}
for Index, Survivor in pairs(pSurvivors) do
if Playing[Survivor] then
pcall(function()
Survivor.Character:MoveTo(Vector3.new(math.random(-90, 90), 35, math.random(-90, 90)))
while (Vector3.new() - Survivor.Character.Humanoid.Torso.Position).magnitude < 50 do
Survivor.Character:MoveTo(Vector3.new(math.random(-90, 90), 35, math.random(-90, 90)))
end
Survivor.Character.Humanoid.Died:connect(function() Survivors[Survivor] = nil end)
Survivors[Survivor] = true
WaveTime = WaveTime + 3.75
end)
end
end
WaveTime = math.floor(WaveTime)
Hungries = Instance.new("Model")
Hungries.Name = "Hungries"
Hungries.Parent = workspace
Talk("Starting game...", 2)
HorrorSound:Play()
Spawn(function()
Infections = {}
function GetClosestPart(c)
local t, dist = nil, 100000
for _ in pairs(Survivors) do
local e
if pcall(function() e = _.Character.Humanoid.Torso end) then
if (c.Position - e.Position).magnitude < dist then
dist = (c.Position - e.Position).magnitude
t = e
end
end
end
return t, dist
end
function Eat(part, ir, s)
part.CanCollide = false
part.Anchored = true
while (part.Position - ir.Position).magnitude > Siz / 3 do
local c = {part.CFrame:components()}
local v = part.Position + CFrame.new(part.Position, ir.Position).lookVector * SuckSpeed
c[1] = v.X
c[2] = v.Y
c[3] = v.Z
part.CFrame = CFrame.new(unpack(c))
wait()
end
s:Play()
part.Anchored = false
part:BreakJoints()
local p = Join(ir, part)
wait(EatTime)
if p.Parent then
Kill(part)
end
end
function Kill(part)
part:Remove() -- For now.
end
function Join(Part0, Part1)
local Connector = Instance.new("Weld")
Connector.C0 = Part0.CFrame:inverse()
Connector.C1 = Part1.CFrame:inverse()
Connector.Part0 = Part0
Connector.Part1 = Part1
Connector.Parent = Part0
return Connector
end
function MakeNew(pos)
local ttt = 0
local i = Instance.new("Part")
Infections[i] = true
i.BottomSurface = 0
i.Color = BrickColor3.new(math.random(0, 1), math.random(0, 1), math.random(0, 1))
i.formFactor = 0
i.Locked = true
i.Parent = Hungries
i.Position = pos
i.Shape = 0
i.Size = Size
i.Transparency = 0.3
i.TopSurface = 0
local s = Instance.new("Sound")
s.SoundId = SuckSoundId
s.Parent = i
i.Touched:connect(function(Hit)
if Hit:GetMass() < BallMass and not Infections[Hit] and not Hit:IsDescendantOf(Lobby) then
Infections[Hit] = true
Eat(Hit, i, s)
ttt = ttt + 1
if ttt > copyrate then
ttt = 0
for i = 1, Multiplier do
MakeNew(Hit.Position)
end
end
end
end)
local life = 40
local v = Instance.new("BodyAngularVelocity")
v.angularvelocity = Vector3.new()
v.P = 3
v.maxTorque = Vector3.new(1e+15, 1e+15, 1e+15)
v.Parent = i
while true do
if workspace.RUN.Value == 0 then
break
end
wait(0.1)
--if i.Position.X < -95 or i.Position.X > 95 or i.Position.Y < 0 or i.Position.Y > 40 or i.Position.Z < -95 or i.Position.Z > 95 then
--i.Position = Vector3.new()
--end
if math.random(1, 50) == 1 then
i.Velocity = i.Velocity + Vector3.new(0, 50, 0)
end
if i.Velocity.magnitude > 50 then
i.Velocity = i.Velocity.unit * 50
end
local t, Dist = GetClosestPart(i)
if t then
t = t.Position - i.Position
local x = -t.z
local y = 0
local z = t.x
v.angularvelocity = -Vector3.new(x, y, z).unit * 40 * ((t.x^2+t.z^2)^0.5/Dist/4+0.75)
end
life = life - 0.1
if life <= 0 then
break
end
end
Kill(i, i)
end
MakeNew(Vector3.new())
end)
for i = WaveTime, 0, -1 do
Talk(i .. " seconds till wave ends. Survive for points!", 1)
local nSurvivors = 0
for Survivor in pairs(Survivors) do
nSurvivors = nSurvivors + 1
end
if #Hungries:GetChildren() == 0 then
WonSound:Play()
Talk("All " .. BallName .. " died!", 3)
workspace.RUN.Value = 0
break
end
end
end
function EndWave()
Infections = {}
Hungries:Remove()
PingSound:Play()
Talk("Game over!", 4)
local nSurvivors = 0
for Survivor in pairs(Survivors) do
nSurvivors = nSurvivors + 1
end
local Index = 1
local sSurvivors = ""
for Survivor in pairs(Survivors) do
if Index > 1 then
if Index == nSurvivors then
sSurvivors = sSurvivors .. " and "
else
sSurvivors = sSurvivors .. ", "
end
end
sSurvivors = sSurvivors .. Survivor.Name
Index = Index + 1
end
if nSurvivors > 0 then
local Points = math.ceil(WavePoints / nSurvivors)
for Survivor in pairs(Survivors) do
pcall(function() Survivor.leaderstats.Points.Value = Survivor.leaderstats.Points.Value + Points end)
--pcall(function() Survivor.Character:BreakJoints() end)
pcall(function() for Index, Value in pairs(Badges) do if Survivor.leaderstats.Points.Value >= Index then AwardBadge(Survivor, Value) end end end)
end
Talk(sSurvivors .. " survived and got " .. Points .. " points.", 4)
else
Talk("Everybody died. No points for this round.", 4)
end
end
function CountDown()
for i = CountDownTime, 0, -1 do
Talk("New game starting in " .. i .. " seconds.", 1)
end
end
function GetMass(Object, Mass)
Mass = Mass or 0
if Object:IsA("BasePart") then Mass = Mass + Object:GetMass() end
for Index, Value in pairs(Object:GetChildren()) do
Mass = GetMass(Value, Mass)
end
return Mass
end
function UpdatePowerUps(Player)
pcall(function() Player.Character.Humanoid.WalkSpeed = Powerups[Player].WalkSpeed end)
pcall(function()
local Torso = Player.Character.Humanoid.Torso
local AntiGrav = Torso:FindFirstChild("BodyForce") or Instance.new("BodyForce")
AntiGrav.force = Vector3.new(0, GetMass(Player.Character) * 196.2 * Powerups[Player].AntiGrav / 100, 0)
AntiGrav.Parent = Torso
end)
end
function PlayerJoined(Player)
local Stats = Instance.new("IntValue")
Stats.Name = "leaderstats"
Stats.Parent = Player
local Points = Instance.new("IntValue")
Points.Name = "Points"
Points.Value = 0
Points.Parent = Stats
Powerups[Player] = {WalkSpeed = 16, AntiGrav = 0}
Player.CharacterAdded:connect(function(Character)
UpdatePowerUps(Player)
Character.DescendantAdded:connect(function()
UpdatePowerUps(Player)
end)
Character.DescendantRemoving:connect(function()
UpdatePowerUps(Player)
end)
local Gui = Instance.new("ScreenGui")
Gui.Name = "SpectateGui"
local Button = Instance.new("TextButton")
Button.BackgroundColor3 = Color3.new(0.1, 0.8, 0.9)
Button.BackgroundTransparency = 0.2
Button.Position = UDim2.new(0, 0, 1, -90)
Button.Size = UDim2.new(0, 350, 0, 20)
Button.Text = ({[false] = "Spectating", [true] = "Playing"})[Playing[Player]] .. " (Click to switch)"
Button.Parent = Gui
Button.MouseButton1Click:connect(function()
Playing[Player] = not Playing[Player]
Button.Text = ({[false] = "Spectating", [true] = "Playing"})[Playing[Player]] .. " (Click to switch). It will affect you whenever a new round starts."
end)
local WalkspeedUp = Instance.new("TextButton")
WalkspeedUp.BackgroundColor3 = Color3.new(0.9, 0.9, 0.9)
WalkspeedUp.BackgroundTransparency = 0.2
WalkspeedUp.Position = UDim2.new(0, 0, 1, -110)
WalkspeedUp.Size = UDim2.new(0, 155, 0, 20)
WalkspeedUp.Text = "WalkSpeed +2 for 50 points (" .. Powerups[Player]["WalkSpeed"] .. ")"
WalkspeedUp.Parent = Gui
WalkspeedUp.MouseButton1Click:connect(function()
if Powerups[Player]["WalkSpeed"] < 60 then
if Points.Value >= 50 then
Points.Value = Points.Value - 50
Powerups[Player]["WalkSpeed"] = Powerups[Player]["WalkSpeed"] + 2
WalkspeedUp.Text = "WalkSpeed +2 for 50 points (" .. Powerups[Player]["WalkSpeed"] .. ")"
UpdatePowerUps(Player)
end
end
if Powerups[Player]["WalkSpeed"] >= 60 then
WalkspeedUp.Text = "WalkSpeed Maximum (60)"
end
end)
local GravityUp = Instance.new("TextButton")
GravityUp.BackgroundColor3 = Color3.new(0.9, 0.9, 0.9)
GravityUp.BackgroundTransparency = 0.2
GravityUp.Position = UDim2.new(0, 0, 1, -130)
GravityUp.Size = UDim2.new(0, 155, 0, 20)
GravityUp.Text = "Gravity -4% for 50 points (" .. 100 - Powerups[Player]["AntiGrav"] .. "%)"
GravityUp.Parent = Gui
GravityUp.MouseButton1Click:connect(function()
if Powerups[Player]["AntiGrav"] < 60 then
if Points.Value >= 50 then
Points.Value = Points.Value - 50
Powerups[Player]["AntiGrav"] = Powerups[Player]["AntiGrav"] + 4
GravityUp.Text = "Gravity -4% for 50 points (" .. 100 - Powerups[Player]["AntiGrav"] .. "%)"
UpdatePowerUps(Player)
end
if Powerups[Player]["AntiGrav"] >= 60 then
GravityUp.Text = "Gravity Minimum (40%)"
end
end
end)
local TutorialLabel = Instance.new("ImageLabel")
TutorialLabel.BackgroundColor3 = Color3.new(1, 0.9, 0.2)
TutorialLabel.BackgroundTransparency = 0.2
TutorialLabel.Position = UDim2.new(0, 0, 1, -268)
TutorialLabel.Size = UDim2.new(0, 1, 0, 1)
TutorialLabel.Parent = Gui
local Index = 0
local PlayerGui = Player:FindFirstChild("PlayerGui")
while not PlayerGui do wait() PlayerGui = Player:FindFirstChild("PlayerGui") end
Gui.Parent = PlayerGui
while PlayerGui.Parent do
Index = Index + 1
if Index > #Tutorial then Index = 1 end
TutorialLabel.Image = Tutorial[Index]
wait(5)
end
end)
Playing[Player] = true
Spawn(function()
if Game:GetService("BadgeService"):UserHasBadge(Player.userId, VipId) then
Powerups[Player] = {WalkSpeed = 30, AntiGrav = 24}
end
end)
end
function PlayerLeft(Player)
pcall(function() Surviviors[Player] = nil end)
end
Game:GetService("Players").PlayerAdded:connect(PlayerJoined)
Game:GetService("Players").PlayerRemoving:connect(PlayerLeft)

--PlayerJoined(game.Players.BrentDaMage)
for _, player in pairs(Game:GetService("Players"):GetChildren()) do
	if player:FindFirstChild("leaderstats") == nil then
	PlayerJoined(player)
	end
end
while true do
if Game:GetService("Players").NumPlayers > 0 then
CountDown()
local Stage = GetStage():Clone()
if Stage:FindFirstChild("BaseColor") then
Base.BrickColor = Stage.BaseColor.Value
else
Base.BrickColor = BrickColor.new("Camo")
end
Stage.Name = "RUNMap"
Stage.Parent = workspace
Stage:MakeJoints()
Base:MakeJoints()
--for Index, Object in pairs(Stage:GetChildren()) do if Object:IsA("BasePart") then Object.Velocity = Vector3.new() Object.RotVelocity = Vector3.new() end end
local b = StartWave()
Stage:Remove()
if not b then
EndWave()
end
Base.BrickColor = BrickColor.new("Navy blue")
else
wait()
end
end