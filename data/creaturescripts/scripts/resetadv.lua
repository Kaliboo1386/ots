function onAdvance(cid, skill, oldlevel, newlevel)

   if(skill ~= SKILL__LEVEL) then
      return true
   end 

   local name = getPlayerName(cid)   
   local rebornValue = getPlayerReborn(cid)
   local t = REBORN_SYSTEM:getRebornTableByValue(rebornValue + 1)
   local minLevel = t.requiredLevel
   
   if newlevel < minLevel then 
	  return true
   end
     
   local exhaustString = REBORN_SYSTEM:getExhaustString(cid)
   if exhaustString then
      doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Limit Rebornowy!" .. "\n" .. "Reborn Dostepny za: " .. exhaustString)
	  return true
   end
   
   doPlayerAddReborn(cid)
    doPlayerSetLevel(cid, t.startLevel)
    doPlayerSetExperience(cid, t.startExperience)
    
    REBORN_SYSTEM:setExhaust(cid)
    
    local teleportTable = t.teleportPosition
    if teleportTable then
        doTeleportThing(cid, teleportTable)
    end
    
    local magicEffect = t.magicEffect
    if magicEffect then
       local pos = getCreaturePosition(cid)
 	  doSendMagicEffect(pos, magicEffect)
    end
    
    local reb = getPlayerReborn(cid)
    local msg = "Gratulacje, twoj reborn poziom zwiekszyl sie z " .. rebornValue .. " na " .. reb .. "."
    
    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, msg)
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, msg)
    
    -- Recalculate total persistent bonuses from config
    REBORN_SYSTEM:recalculateBonuses(cid)
    
    local rewards = t.rewards
    if rewards then
       REBORN_SYSTEM:addRewards(cid, rewards)
    end

    doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
    doCreatureAddMana(cid, getPlayerMaxMana(cid))
   
   if t._broadcastMessage then
      doBroadcastMessage("Gracz " .. name .. " zdobyl " ..  reb .. " reborn, gratulacje!", 21) 
   end
   
   return true
end
