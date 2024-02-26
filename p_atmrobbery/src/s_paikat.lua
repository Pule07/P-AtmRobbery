ESX = exports["es_extended"]:getSharedObject()


ESX.RegisterServerCallback('atm:getPoliceCount', function(source, cb)
  count = 0

  for _, playerId in pairs(ESX.GetPlayers()) do
      xPlayer = ESX.GetPlayerFromId(playerId)
      if xPlayer.job.name == 'police' then
          count = count + 1
      end
  end

  cb(count)
end)


local tyypit = {
  "black_money",
  "money",
}


local randomIndexi = math.random(#tyypit)
local randomItemi = tyypit[randomIndexi]



RegisterServerEvent("pule:atm:robbery")
AddEventHandler("pule:atm:robbery", function ()
local xPlayer = ESX.GetPlayerFromId(source)

local randomIndexi = math.random(#tyypit)
local randomItemi = tyypit[randomIndexi]

local tyypit = {
  "black_money",
  "money",
}


local randomIndexi = math.random(#tyypit)
local randomItemi = tyypit[randomIndexi]


  local rahat = math.random(250, 650)

  xPlayer.addInventoryItem(randomItemi, rahat)






end)
