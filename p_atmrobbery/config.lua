P = {}

P.dispatch = "qs-dispatch" -- OPTIONS: 1 = "qs-dispatch",  2 = "cd-dispatch", 3 = "core-dispatch", 4 = "op-dispatch"

-- LOGS ARE IN s_paikat.lua 

P.rob_only_once = true -- if set to FALSE then you can rob the same ATM multiple times (no cooldowns etc)

P.cooldown_time = 5 -- Cooldown is minutes Default = 5

P.progress_time = 15 -- default = 15 seconds

P.police_count = 1



P.notify = {
    ["text_color"] = "#ffffff",
    ["background_color"] = "#000000",
    ["icon"] = "fa-solid fa-tools",

}


P.locales = {
    ["rob"] = "Rob this ATM",

    ["nopolice"] = "Not enough police!",

    ["robbery"] = "Robbery",

    ["Robbery title"] = "ATM Robbery",
    ["Robbery desc"] = "Someone is breaking an ATM",

    ["progressbar"] = "Robbing...",

    ["fail"] = "You failed.",
    ["robbery_success"] = "Robbery was a success!"
    
}



