ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("Show:Chat")
AddEventHandler("Show:Chat", function()
    SendNUIMessage({
        action = "show",
    })
    
end)

RegisterNetEvent("Hide:Chat")
AddEventHandler("Hide:Chat", function()
    SendNUIMessage({
        action = "hide",
    })
end)

RegisterNUICallback("message", function(data)
    local Input  = data.input
    local cleanedCommand = Input:sub(2)

    ExecuteCommand(cleanedCommand)
end)


Citizen.CreateThread(function()
  while true do
    
    if IsControlJustPressed(0, 38) then
        TriggerEvent("Show:Chat")
        
    end
    Citizen.Wait(150)
     
   end
end)