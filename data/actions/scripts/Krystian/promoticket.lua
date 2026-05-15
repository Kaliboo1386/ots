local config = {
	promotion = 2,	-- promotion level, default = 1 . Ignore if you don't have new vocations.
	cost = 40000, 	-- Promotion cost in gp
	premium = "yes",  -- is premium needed to buy promotion?
	ticket = 9004,
	minReborn = 2
}

local disabledVocations = {0}

function onUse(cid, item, frompos, item2, topos)
	if item.itemid == 9004 then
		if(isInArray(disabledVocations, getPlayerVocation(cid)) == TRUE) then
			doPlayerSendCancel(cid, "Your vocation cannot buy promotion.")
		elseif(config.premium == TRUE and isPremium(cid) == FALSE) then
			doPlayerSendCancel(cid, "You need a premium account.")
		elseif(getPlayerPromotionLevel(cid) >= config.promotion) then
			doPlayerSendCancel(cid, "You are already promoted.")
		elseif(getPlayerReborn(cid) < config.minReborn) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You need at least " .. config.minReborn .. " reborn to use this ticket.")
		else
			--doPlayerRemoveItem(cid, config.ticket, 1)
			doRemoveItem(item.uid)
			setPlayerPromotionLevel(cid, config.promotion)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "You have been succesful promoted to " .. getVocationInfo(getPlayerVocation(cid)).name .. ".")
			--doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Wait please.")
			
		end
	end
	return TRUE
end