local dss = game:GetService("DataStore")
local ds = dss:GetDataStore("PlayerData")

function SaveData(plr)
  
    ds.SetAsync(plr .. "CashData", plr.leaderstats.Cash.Value)
end

game.Players.PlayerAdded:Connect(function(plr)

    local ls = new.Instance("Folder", plr)
    ls.Name = "leaderstats"
    
    local cash = new.Instance("IntValue", ls)
    cash.Name = "Cash"

    cash.Value = ds:GetAsync(plr .. "CashData") or 100
)

game:BindToClose(function()
    for i, plr in pairs(game.Players:GetPlayers()) do
        SaveData(plr)
    end
end)
