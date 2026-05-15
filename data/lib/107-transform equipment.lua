if not TRANSFORM_EQUIPMENT then
   TRANSFORM_EQUIPMENT = {}
end

TRANSFORM_EQUIPMENT.config = {
                               [7697] = {
							              ["Vocations"] = {
										                     ["Knight"] = {
															                vocationTransformId = 16,
																			bonuses = {
																			            changeOutfit = {
																						                 lookType = 5,
																						               },
																						increaseHealth = 20, --- w procentach
																						increaseMana = 20, --- w procentach
																					  },
																			effects = {
																						 onEquip = CONST_ME_MAGIC_GREEN,
																						 onDeEquip = CONST_ME_POFF
																					  },
                                                                         },	
										                     ["Paladin"] = {
															                vocationTransformId = 15,
																			bonuses = {
																			            changeOutfit = {
																						                 lookType = 6,
																						               },
																						increaseHealth = 20, --- w procentach
																						increaseMana = 20, --- w procentach
																					  },
																			effects = {
																						 onEquip = CONST_ME_MAGIC_GREEN,
																						 onDeEquip = CONST_ME_POFF
																					  },
                                                                          },		
										                     ["Sorcerer"] = {
															                vocationTransformId = 13,
																			bonuses = {
																			            changeOutfit = {
																						                 lookType = 6,
																						               },
																						increaseHealth = 20, --- w procentach
																						increaseMana = 20, --- w procentach
																					  },
																			effects = {
																						 onEquip = CONST_ME_MAGIC_GREEN,
																						 onDeEquip = CONST_ME_POFF
																					  },
                                                                          },		
										                     ["Druid"] = {
															                vocationTransformId = 14,
																			bonuses = {
																			            changeOutfit = {
																						                 lookType = 6,
																						               },
																						increaseHealth = 20, --- w procentach
																						increaseMana = 20, --- w procentach
																					  },
																			effects = {
																						 onEquip = CONST_ME_MAGIC_GREEN,
																						 onDeEquip = CONST_ME_POFF
																					  },
                                                                          },																			  
                                                          }
                                         }
                             }


TRANSFORM_EQUIPMENT.storage = 1213518


function TRANSFORM_EQUIPMENT:setVocation(cid, item, value)
   
   local itemStorage = self.storage
   local itemid = item.itemid
   
   local itemValue = getPlayerStorageValue(cid, itemStorage)
   if itemValue == itemid then
      return false
   end
   doPlayerSetStorageValue(cid, itemStorage, itemid)
   doPlayerSetStorageValue(cid, itemStorage + 1, value)
end

function TRANSFORM_EQUIPMENT:getVocation(cid, method)
    return getPlayerStorageValue(cid, self.storage + 1)
end


function TRANSFORM_EQUIPMENT:getVocationString(cid)   
   local playerVocationInfo = getVocationInfo(getPlayerVocation(cid))   
   local voc = playerVocationInfo.name:lower()
   local id = playerVocationInfo.id
      
   if string.find(voc, "knight") then
      return "Knight"
   elseif string.find(voc, "paladin") then
      return "Paladin"
   elseif string.find(voc, "sorcerer") then
      return "Sorcerer"
   elseif string.find(voc, "druid") then
      return "Druid"
   end
   
   return false
end

function TRANSFORM_EQUIPMENT:getItemTable(cid, id)
    local t = self.config[id]
	if not t then
	   return false
	end
	
	
	local voc = TRANSFORM_EQUIPMENT:getVocationString(cid)
	if not voc then
	   return false
	end
	
	local vocTable = t["Vocations"][voc]
	if not vocTable then
	   return false
	end
	
	return vocTable
end

function TRANSFORM_EQUIPMENT:updateItem(cid, item, onEquip)
   local id = item.itemid
   local t = TRANSFORM_EQUIPMENT:getItemTable(cid, id)
   
   if not t then
      return false
   end
   
   local newVoc = t.vocationTransformId
   if newVoc then
      if onEquip then
		 self:setVocation(cid, item, getPlayerVocation(cid))
	     doPlayerSetVocation(cid, newVoc)
	  else
	     local id = TRANSFORM_EQUIPMENT:getVocation(cid)
		 doPlayerSetVocation(cid, id)
	  end
   end
   
   local effect = t.effects
   if effect then
      local pos = getCreaturePosition(cid)
      if onEquip then
	     local effectValue = effect.onEquip
		 if effectValue then
	        doSendMagicEffect(pos, effectValue)
	     end
	  else
	     local effectValue = effect.onDeEquip
		 if effectValue then
		    doSendMagicEffect(pos, effectValue)
	     end
	  end
   end
   
   local bonuses = t.bonuses
   if bonuses then
      local changeOutfit = bonuses.changeOutfit
	  if changeOutfit then
         local condition = createConditionObject(CONDITION_OUTFIT)
         setConditionParam(condition, CONDITION_PARAM_TICKS, -1)
		 
		 local lookType = changeOutfit.lookType
		 if not lookType then
		    lookType = 0
		 end
		 
		 local lookHead = changeOutfit.lookHead
		 if not lookHead then
		    lookHead = 0
	     end
		 
		 local lookBody = changeOutfit.lookBody
		 if not lookBody then
		    lookBody = 0
	     end
		 
		 local lookLegs = changeOutfit.lookLegs
		 if not lookLegs then
		    lookLegs = 0
	     end
		 
		 local lookFeet = changeOutfit.lookFeet
		 if not lookFeet then
		    lookFeet = 0
	     end		 
		 
         addOutfitCondition(condition, {lookType = lookType, lookHead = lookHead, lookBody = 0, lookLegs = 0, lookFeet = 0})
	     if onEquip then
		    doAddCondition(cid, condition)
	     else
		    doRemoveCondition(cid, CONDITION_OUTFIT)
		 end
	 end
	 
	 

	 local condition = createConditionObject(CONDITION_ATTRIBUTES)
	 local subid = 100
	 setConditionParam(condition, CONDITION_PARAM_SUBID, subid)
	 setConditionParam(condition, CONDITION_PARAM_TICKS, -1)
	 
	 local increaseHealth = bonuses.increaseHealth
	 if increaseHealth then
	    if onEquip then
		   setConditionParam(condition, CONDITION_PARAM_STAT_MAXHEALTHPERCENT, 100 + increaseHealth)
        end
	 end
	 
	 local increaseMana = bonuses.increaseMana
	 if increaseMana then
	    if onEquip then
		   setConditionParam(condition, CONDITION_PARAM_STAT_MAXMANAPERCENT, 100 + increaseMana)
        end
	 end
	 
	  
	  
	  if onEquip then
	     doAddCondition(cid, condition)
	  else
		 doRemoveCondition(cid, CONDITION_ATTRIBUTES, subid)
	  end
		
  end
	     
   
   
end
														   
