ESX = exports["es_extended"]:getSharedObject()

local playerIdx = GetPlayerFromServerId(source)
local ped = GetPlayerPed(playerIdx)


local poliisit = false
local model = {'prop_atm_02', '	prop_atm_03', "prop_atm_01", "prop_fleeca_atm"}


    exports.ox_target:addModel(model, {
        {
            label = "Rob ATM",
            icon = 'fa-solid fa-tools',

            onSelect = function ()
                if GetSelectedPedWeapon(ped) == GetHashKey("weapon_crowbar") then
                rob_atm()
                end
            end,
        }
    })


    
    function rob_atm()
        cops = 0
        ESX.TriggerServerCallback('atm:getPoliceCount', function(_cops)
            cops = _cops
        end)
    
        Wait(500)
    
        if cops < P.police_count then
            ESX.ShowNotification("~r~Not enough police!")
            return
        else


        local success = lib.skillCheck({'medium', 'medium', 'hard'}, {'e'})

        if success then

        local success2 = lib.progressBar({
            duration = (P.progress_time * 1000),
            label = 'Robbing ATM',
            useWhileDead = false,
            canCancel = false,
            disable = {
                car = true,
                move = true
            },
            anim = {
                dict = 'mini@repair',
                clip = 'fixing_a_ped' 
            },
        })
        if success2 then
            TriggerServerEvent("pule:atm:robbery")
            lib.notify({
                title = 'You got the ATM`s cash!',
                position = 'center-right',
                style = {
                    backgroundColor = '#141517',
                    color = '#C1C2C5',
                    ['.description'] = {
                      color = '#909296'
                    }
                },
                icon = 'check-double',
                iconColor = '#34eb34'
            })
    else
        lib.notify({
            title = 'You FAILED!',
            position = 'center-right',
            style = {
                backgroundColor = '#141517',
                color = '#C1C2C5',
                ['.description'] = {
                  color = '#909296'
                }
            },
            icon = 'x',
            iconColor = '#C53030'
        })

    
    end
else
    lib.notify({
        title = 'You FAILED!',
        position = 'center-right',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
              color = '#909296'
            }
        },
        icon = 'x',
        iconColor = '#C53030'
    })
    end
    local PlayerPed = PlayerPedId()
    local coords = GetEntityCoords(PlayerPed)





    if P.dispatch == "qs-dispatch" then


    local playerData = exports['qs-dispatch']:GetPlayerInfo()

    if (not playerData) then
        ErrorPrint("Error getting player data")
        return
    end
    
     exports['qs-dispatch']:getSSURL(function(image)
        local dispatch = TriggerServerEvent('qs-dispatch:server:CreateDispatchCall', {
            job = { 'police', 'sheriff', 'traffic', 'patrol' },
            callLocation = playerData.coords,
            callCode = { code = 'ATM', snippet = 'ROBBERY' },
            message = "Someone is robbing a atm",
            flashes = false,
            image = "https://cdn.discordapp.com/attachments/1207717557637746759/1209514644750729276/image.png?ex=65e7334b&is=65d4be4b&hm=136f478ae6ec26be4e912e91bd70e50a781805cd1db27daeac80f0b3ba09f9ce&", -- Url for image to attach to the call 
            blip = {
                sprite = 500,
                scale = 1.9,
                colour = 1,
                flashes = true,
                text = 'An ATM Robbery',
                time = (20 * 100000),     --20 secs
            }
        })
    end)

elseif P.dispatch == "cd-dispatch" then
    local data = exports['cd_dispatch']:GetPlayerInfo()
    local dispatch = TriggerServerEvent('cd_dispatch:AddNotification', {
        job_table = {'police', }, 
        coords = data.coords,
        title = '10-15 - ATM Robbery',
        message = 'ATM Robbery at '..data.street, 
        flash = 0,
        unique_id = data.unique_id,
        sound = 1,
        blip = {
            sprite = 431, 
            scale = 1.2, 
            colour = 3,
            flashes = false, 
            text = '911 - ATM Robbery',
            time = 5,
            radius = 0,
        }
    })

        end

    if P.rob_only_once then
        exports.ox_target:removeModel(model)

        Wait(P.cooldown_time * 60000)

        exports.ox_target:addModel(model, {
            {
                label = "Rob ATM",
                icon = 'fa-solid fa-tools',
    
                onSelect = function ()
                    if GetSelectedPedWeapon(ped) == GetHashKey("weapon_crowbar") then
                    rob_atm()
                    end
                end,
            }
        })

end
end
end


