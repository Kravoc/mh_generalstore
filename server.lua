local data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent('mh:buygeneral')
AddEventHandler('mh:buygeneral', function(price, item, level)
	local _item = item
	local _level = level
	local _source = source
	TriggerEvent('redemrp:getPlayerFromId', _source, function(user) 
		local identifier = user.getIdentifier()
		local ulevel = user.getLevel()
		local charid = user.getSessionVar("charid")
		if user.getMoney() >= price then
			if ulevel >= _level then
				user.removeMoney(price)
				data.addItem(_source, _item, 1)
			else 
				TriggerClientEvent('Message:missinglevel', source)
			end
		else
			TriggerClientEvent('Message:cancel', source)
		end
	end)
end)

