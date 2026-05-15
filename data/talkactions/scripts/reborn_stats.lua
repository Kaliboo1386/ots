function onSay(cid, words, param, channel)
	local reborn = getPlayerReborn(cid)
	local level = getPlayerLevel(cid)
	local experience = getPlayerExperience(cid)
	local health = getCreatureHealth(cid)
	local maxHealth = getCreatureMaxHealth(cid)
	local mana = getPlayerMana(cid)
	local maxMana = getPlayerMaxMana(cid)
	
	local text = "--- Character Stats ---\n"
	text = text .. "Reborn: " .. reborn .. "\n"
	text = text .. "Level: " .. level .. "\n"
	text = text .. "Experience: " .. string.format("%.0f", experience) .. "\n"
	text = text .. "Hit Points: " .. health .. " / " .. maxHealth .. " (" .. math.min(100, math.floor(health * 100 / math.max(1, maxHealth))) .. "%)\n"
	text = text .. "Mana: " .. mana .. " / " .. maxMana .. " (" .. math.min(100, math.floor(mana * 100 / math.max(1, maxMana))) .. "%)\n"
	
	doShowTextDialog(cid, 2160, text)
	return true
end
