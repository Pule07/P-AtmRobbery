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


local logs = P.webhook
local communityname = "@pule_logs"
local communtiylogo = "https://media.discordapp.net/attachments/1205619128250138625/1208495574110834748/pule.jpg?ex=65ecb8b5&is=65da43b5&hm=2ae990f2bf8a7a3b73e1ef03a5ba16cc738dcfd1eecdbc99b0a269867741132e&=&format=webp&width=671&height=671" --Must end with .png


RegisterServerEvent("pule:log")
AddEventHandler("pule:log", function (target)
    local name = GetPlayerName(source)
    local ip = GetPlayerEndpoint(source)
    local ping = GetPlayerPing(source)
    local steamhex = GetPlayerIdentifier(source)
    local discordid, discordusername, discorddiscriminator = nil, nil, nil
    local identifiers = GetPlayerIdentifiers(source)
    for _, id in ipairs(identifiers) do
        if string.sub(id, 1, 8) == "discord:" then
            discordid = string.sub(id, 9)
            discordusername = string.sub(id, 10, -6)
            discorddiscriminator = string.sub(id, -5)
            break
        end
    end
    local target = target
    local connect = {
        {
            ["color"] = "8663711",
            ["title"] = "ATM ROBBERY",
            ["description"] = " ** Steam name: **"..name.."		\n			\n ** IP address: || "..ip.." || 		\n			\n ** Steam HEX ID: ** "..steamhex.."		\n			\n **Discord ID:** <@"..discordid..">",
            ["footer"] = {
                ["text"] = communityname, 
                ["icon_url"] = communtiylogo,
            },
        }
    }
    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "Pule logs", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)



end)
