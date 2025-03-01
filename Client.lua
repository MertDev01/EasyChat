RegisterNetEvent("Show:Chat")
AddEventHandler("Show:Chat", function()
    SendNUIMessage({action = "show",})
    SetNuiFocus(true, true)

end)

RegisterNetEvent("Hide:Chat")
AddEventHandler("Hide:Chat", function()
    SendNUIMessage({action = "hide",})
    SetNuiFocus(false, false)
end)

RegisterNUICallback("message", function(data)
    local input = data.input
    local cleanedCommand = input:sub(2)
    ExecuteCommand(cleanedCommand)
    SetNuiFocus(false, false)
end)

RegisterNUICallback("removeFocus", function(data)
    TriggerEvent("Hide:Chat")
end)

CreateThread(function()
    while true do
        if IsControlJustPressed(0, 309) then 
            TriggerEvent("Show:Chat")
        end

    
        DisableMultiplayerChat(true) 
        Wait(10)
    end
end)
