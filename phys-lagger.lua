function getPlayer(shortcut)
  local player = nil

  local g = game.Players:GetPlayers()
  for i = 1, #g do
    if string.lower(string.sub(g[i].Name, 1, string.len(shortcut))) == string.lower(shortcut) then
      player = g[i]
      break
    end
  end

  return player
  

end

local TargetsName = getPlayer('SHORTENED USERNAME')

function GetPlayer(Name)
    local plrs = game:GetService("Players"):GetPlayers()
    local plrTargets = {}
    for index, plr in pairs(plrs) do
        if plr.Name:sub(1, #Name):lower() == Name:lower() or plr.DisplayName:sub(1, #Name):lower() == Name:lower() then
            table.insert(plrTargets, plr)
        end
    end
    return plrTargets
end

local RunService = game:GetService("RunService")

local x = Instance.new("BindableEvent")
for _, v in ipairs({RunService.RenderStepped, RunService.Heartbeat, RunService.Stepped}) do
    v.Connect(v, function()
        return x.Fire(x, tick())
    end)
end
shared.SuperStepped = x.Event

for i,v in pairs(GetPlayer(TargetsName)) do
    TargetsCharacter = v.Character
end

for i, v in pairs(TargetsCharacter:GetDescendants()) do
    if v:IsA("BasePart") then
        shared.SuperStepped:Connect(function()
            sethiddenproperty(v, "NetworkIsSleeping", true)
            sethiddenproperty(v, "NetworkIsSleeping", true)
        end)
    end
end
