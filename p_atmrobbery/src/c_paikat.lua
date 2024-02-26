ESX = exports["es_extended"]:getSharedObject()

local playerIdx = GetPlayerFromServerId(source)
local ped = GetPlayerPed(playerIdx)


local poliisit = false
local model = {'prop_atm_02', '	prop_atm_03', "prop_atm_01", "prop_fleeca_atm"}


    exports.ox_target:addModel(model, {
        {
            label = P.locales["rob"],
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
            ESX.ShowNotification(P.locales["nopolice"])
            return
        else

        TriggerServerEvent("pule:log")
        local success = lib.skillCheck({'medium', 'medium', 'hard'}, {'e'})

        if success then

        local success2 = lib.progressBar({
            duration = (P.progress_time * 1000),
            label = P.locales["progressbar"],
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
                title = P.locales["robbery_success"],
                position = 'center-right',
                style = {
                    backgroundColor = P.notify["background_color"],
                    color = P.notify["text_colour"],
                    ['.description'] = {
                      color = P.notify["text_colour"]
                    }
                },
                icon = 'check-double',
                iconColor = '#34eb34'
            })
    else
        lib.notify({
            title = P.locales["fail"],
            position = 'center-right',
            style = {
                backgroundColor = P.notify["background_color"],
                color = P.notify["text_colour"],
                ['.description'] = {
                  color = P.notify["text_colour"]
                }
            },
            icon = P.notify["icon"],
            iconColor = '#C53030'
        })

    
    end
else
    lib.notify({
        title = P.locales["fail"],
        position = 'center-right',
        style = {
            backgroundColor = P.notify["background_color"],
            color = P.notify["text_colour"],
            ['.description'] = {
              color = P.notify["text_colour"]
            }
        },
        icon = P.notify["icon"],
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
            callCode = { code = 'ATM', snippet = P.locales["robbery"] },
            message = P.locales["Robbery desc"],
            flashes = false,
            image = "https://cdn.discordapp.com/attachments/1207717557637746759/1209514644750729276/image.png?ex=65e7334b&is=65d4be4b&hm=136f478ae6ec26be4e912e91bd70e50a781805cd1db27daeac80f0b3ba09f9ce&", -- Url for image to attach to the call 
            blip = {
                sprite = 500,
                scale = 1.9,
                colour = 1,
                flashes = true,
                text = P.locales["Robbery desc"],
                time = (20 * 100000),     --20 secs
            }
        })
    end)

elseif P.dispatch == "cd-dispatch" then
    local data = exports['cd_dispatch']:GetPlayerInfo()
    local dispatch = TriggerServerEvent('cd_dispatch:AddNotification', {
        job_table = {'police', }, 
        coords = data.coords,
        title = P.locales["Robbery title"],
        message = P.locales["Robbery desc"], 
        flash = 0,
        unique_id = data.unique_id,
        sound = 1,
        blip = {
            sprite = 431, 
            scale = 1.2, 
            colour = 3,
            flashes = false, 
            text = P.locales["Robbery desc"],
            time = 5,
            radius = 0,
        }
    })
elseif P.dispatch == "core.dispatch" then
    TriggerServerEvent(
        "core_dispatch:addMessage",
        P.locales["Robbery title"],
        {coords[1], coords[2], coords[3]},
        "police",
        5000,
        11,
        5
    )
elseif P.dispatch == "op-dispatch" then

        local job = "police" -- Jobs that will recive the alert
        local text = P.locales["Robbery desc"] -- Main text alert
        local coords = GetEntityCoords(PlayerPedId()) -- Alert coords
        local id = GetPlayerServerId(PlayerId()) -- Player that triggered the alert
        local title = P.locales["Robbery title"] -- Main title alert
        local panic = true -- Allow/Disable panic effect
       
        TriggerServerEvent('Opto_dispatch:Server:SendAlert', job, title, text, coords, panic, id)

end

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



